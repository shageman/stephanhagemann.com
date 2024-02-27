#! /usr/bin/env ruby
`
git checkout .
git clean -fd
`

require 'packs'

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
    res[pack_name] = all_packs_by_name.keys - transitive_pack_dependencies[pack_name]
    res
  end

  dependencies_needed_for_testing_by_name
end

deps_to_delete_by_name = packs_that_should_be_deletable_when_testing

result = "#! /usr/bin/env bash

set -e\n\n
"

{
  "packs/agile_landscape" => "agile_landscape",
  #"packs/backlinks",
  "packs/books" => "books",
  "packs/contact" => "contact",
  "packs/posts" => "posts",
  #"packs/rails_shims",
  "packs/root" => "",
  "packs/services" => "services",
  "packs/speaking" => "speaking",
  "packs/tags" => "tags",
}.each do |pack_name, path|
  packs_to_delete = deps_to_delete_by_name[pack_name] - ["."] - [pack_name]
  result += "\n\n\n"
  result += "echo '\n\n>>> Checking isolation of #{pack_name}'\n"
  result += "pkill -f puma || true\n"
  result += "git checkout .\n"
  result += "git clean -fd\n"
  result += "echo ' >> Deleting packs: #{packs_to_delete.join(" ")}'\n"
  result += "#{packs_to_delete.map { "rm -rf #{_1}; " }.join(" ")}\n"
  result += "bin/rails s > /dev/null &\n"
  result += "sleep 3\n"
  result += "echo ' >> Checking server links for 404s starting at: http://localhost:3000/#{path}'\n"
  result += "wget --show-progress --spider -r --header='User-Agent: Mozilla/5.0' --output-file=crawl.log --no-verbose http://localhost:3000/#{path} 2>&1 && echo 'SUCCESS'\n"
  result += "downloaded=$(grep -o 'Downloaded: [0-9]*' crawl.log | awk '{print $2}')\n"
  result += 'echo "  > Checked ${downloaded} pages"'
  result += "\n"
  result += "echo ' >> Running RSpec for pack: `bin/rspec #{pack_name}`'\n"
  result += "bin/rspec --no-profile --format progress #{pack_name}\n"

end

result += "
git checkout .
git clean -fd
pkill -f puma || true
"

File.open("test_isolation.sh", 'w') { |file| file.write(result) }