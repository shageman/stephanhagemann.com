#! /usr/bin/env ruby

`git diff --exit-code`
unstaged = $?.success?
`git diff --cached --exit-code`
committed = $?.success?
if !unstaged || !committed
  puts "You have unstaged or uncommited changes. Aborting."
  exit 1
end

`pkill -f puma || true`

require "packs"

def packs_that_should_be_deletable_when_testing
  all_packs_by_name = Packs.all.inject({}) { |res, item| res[item.name] = item; res }

  result = Packs.all.inject({}) { |res, item| res[item.name] = item.raw_hash["dependencies"] || []; res }
  result_old = nil
  while result != result_old do
    result_old = result.dup
    all_packs_by_name.keys.each do |pack_name_as_key|
      result[pack_name_as_key] += result[pack_name_as_key].map do |pack_name|
        all_packs_by_name[pack_name].raw_hash["dependencies"]
      end
      result[pack_name_as_key] = result[pack_name_as_key].compact.flatten.uniq
    end
  end
  transitive_pack_dependencies = result

  dependencies_needed_for_testing_by_name = all_packs_by_name.keys.inject({}) do |res, pack_name|
    res[pack_name] = all_packs_by_name.keys - # start with the assumption that all packages can be deleted
        ["."] - # never delete the root package
        [pack_name] - # never delete the package in question itself
        transitive_pack_dependencies[pack_name] # don't delete any dependencies
    res
  end

  dependencies_needed_for_testing_by_name
end

deps_to_delete_by_name = packs_that_should_be_deletable_when_testing

web_paths_for_deletion_testing = {
  "." => "up",
  "packs_userfacing/agile_landscape" => "agile_landscape",
  "packs_userfacing/books" => "books",
  "packs_userfacing/contact" => "contact",
  "packs_userfacing/posts" => "posts",
  "packs_userfacing/root" => "",
  "packs_userfacing/services" => "services",
  "packs_userfacing/speaking" => "speaking",
  "packs_userfacing/tags" => "tags",
  "packs_utility/backlinks" => false,
  "packs_utility/rails_shims" => false,
  "packs_utility/routable" => false,
  "packs_utility/taggable" => false,
}
packages_to_test = deps_to_delete_by_name.keys

packages_to_test.each do |pack_name, path|
  packs_to_delete = deps_to_delete_by_name[pack_name]
  puts "\n\n>>> Checking isolation of #{pack_name}"
  if web_paths_for_deletion_testing[pack_name] == nil
    raise "no path set"
    exit 1
  end

  puts " >> Deleting packs:\n      #{packs_to_delete.join("\n      ")}"
  deletion_command = packs_to_delete.map { "rm -rf #{_1}; " }.join(" ")
  `#{deletion_command}` if deletion_command != ""

  puts " >> Running RSpec for pack. Command: `bin/rspec #{pack_name}`"
  puts `bin/rspec --no-profile --format progress #{pack_name} | sed 's/^/    /g'`
  passed = $?.success?
  unless passed
    puts " >> RSpec failed for #{pack_name}"
    exit 1
  end

  if path = web_paths_for_deletion_testing[pack_name]
    `bin/rails s > /dev/null &`
    sleep 3
    puts " >> Checking server links for 404s starting at: http://localhost:3000/#{path}'"
    `wget --show-progress --spider -r --header='User-Agent: Mozilla/5.0' --output-file=crawl.log --no-verbose http://localhost:3000/#{path} 2>&1`
    success = $?.success?
    unless success
      puts "  > 404 check failed for #{pack_name}"
      exit 1
    end
    downloaded = `grep -o 'Downloaded: [0-9]*' crawl.log | awk '{print $2}'`.strip
    puts "  > Checked #{downloaded} pages\n"
  else
    puts " >> Skipping link 404 check due to config.\n"
  end

  `pkill -f puma || true | sed 's/^/    /g'`
  `git checkout . | sed 's/^/    /g'`
  `git clean -fd | sed 's/^/    /g'`
end