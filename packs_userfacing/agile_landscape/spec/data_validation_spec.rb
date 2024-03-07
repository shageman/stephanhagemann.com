# typed: false
require "rails_helper"

RSpec.describe AgileLandscape::Entry do
  it "validates uniqueness of name and version combination" do
    AgileLandscape::Entry.all.each do |entry|
      AgileLandscape::Entry.all.each do |second_entry|
        next if entry.id == second_entry.id

        is_duplicate = entry.name == second_entry.name && entry.version == second_entry.version
        expect(is_duplicate).to(be_falsey, "Entries #{entry.id} and #{second_entry.id} are duplicates")
      end
    end
  end
end

RSpec.describe AgileLandscape::Framework do
  it "validates uniqueness of name and version combination" do
    AgileLandscape::Framework.all.each do |framework|
      AgileLandscape::Framework.all.each do |second_framework|
        next if framework.id == second_framework.id

        is_duplicate = framework.name == second_framework.name && framework.version == second_framework.version
        expect(is_duplicate).to(be_falsey, "Entries #{framework.id} and #{second_framework.id} are duplicates")
      end
    end
  end
end

RSpec.describe AgileLandscape::FrameworkConnection do
  it "ensures versions of connected entries and frameworks are the same" do
    AgileLandscape::FrameworkConnection.all.each do |connection|
      entry_version = connection.entry.version
      framework_version = connection.framework.version
      expect(entry_version).to eq(framework_version)
    end
  end

  it "validates uniqueness of name and version combination" do
    AgileLandscape::FrameworkConnection.all.each do |fc|
      AgileLandscape::FrameworkConnection.all.each do |second_fc|
        next if fc.id == second_fc.id
        is_duplicate = fc.entry_id == second_fc.entry_id && fc.framework_id == second_fc.framework_id
        expect(is_duplicate).to(be_falsey, "Entries #{fc.id} and #{second_fc.id} are duplicates")
      end
    end
  end
end

RSpec.describe AgileLandscape::EntryConnection do
  it "ensures versions of connected entries, connected_entry and frameworks are the same" do
    AgileLandscape::EntryConnection.all.each do |connection|
      entry_version = connection.entry.version
      connected_entry_version = connection.connected_entry.version
      framework_version = connection.framework.version
      expect(entry_version).to eq(framework_version)
      expect(connected_entry_version).to eq(framework_version)
    end
  end

  it "validates uniqueness of connected entries, connected_entry and frameworks" do
    AgileLandscape::EntryConnection.all.each do |connection|
      entry_version = connection.entry.version
      connected_entry_version = connection.connected_entry.version
      framework_version = connection.framework.version
      expect(entry_version).to eq(framework_version)
      expect(connected_entry_version).to eq(framework_version)
    end
  end
end
