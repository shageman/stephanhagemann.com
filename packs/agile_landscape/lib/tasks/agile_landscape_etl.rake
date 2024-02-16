require 'json'

namespace :agile_landscape do
  desc "ETL Agile Landscape Data"
  task etl: :environment do
    json_data = JSON.parse(File.read(File.expand_path(File.join(__FILE__, '../agile_landscape_raw.json'))))

    entries = []
    frameworks = []
    versions = []
    entry_connections = []
    framework_connections = []

    json_data.each do |item|
      version = versions.find { |v| v[:name] == item['Version'] }
      unless version
        version = {
          id: versions.length + 1, # Generating a unique id
          name: item['Version'],
          slug: item['Version'].gsub(/[^0-9a-z]/i, '-') 
        }
        versions << version
      end

      entry = entries.find { |e| e[:name] == item['Name'] && e[:section] == item['Section'] && e[:version_id] == version[:id] }
      unless entry
        entry = {
          id: entries.length + 1, # Generating a unique id
          name: item['Name'],
          section: item['Section'],
          version_id: version[:id],
          slug: item['Name'].gsub(/[^0-9a-z]/i, '-')
        }
        entries << entry
      end

      framework = frameworks.find { |f| f[:name] == item['Framework'] && f[:color] == item['Color'] && f[:version_id] == version[:id] }
      unless framework
        framework = {
          id: frameworks.length + 1, # Generating a unique id
          name: item['Framework'],
          color: item['Color'],
          version_id: version[:id],
          slug: item['Framework'].gsub(/[^0-9a-z]/i, '-')
        }
        frameworks << framework
      end

      framework_connection = {
        id: framework_connections.length + 1, # Generating a unique id
        entry_id: entry[:id],
        framework_id: framework[:id],
      }
      framework_connections << framework_connection

      # Create connection for 'Next 1'
      if item['Next 1'].present?
        next_entry_1 = entries.find { |e| e[:name] == item['Next 1'] && e[:version_id] == version[:id] }
        if next_entry_1
          connection = {
            id: entry_connections.length + 1, # Generating a unique id
            entry_id: entry[:id],
            framework_id: framework[:id],
            connected_entry_id: next_entry_1[:id]
          }
          entry_connections << connection

          # Create inverse connection
          inverse_connection = {
            id: entry_connections.length + 1, # Generating a unique id
            entry_id: next_entry_1[:id],
            framework_id: framework[:id],
            connected_entry_id: entry[:id]
          }
          entry_connections << inverse_connection
        end
      end

      # Create connection for 'Next 2'
      if item['Next 2'].present?
        next_entry_2 = entries.find { |e| e[:name] == item['Next 2'] && e[:version_id] == version[:id] }
        if next_entry_2
          connection = {
            id: entry_connections.length + 1, # Generating a unique id
            entry_id: entry[:id],
            framework_id: framework[:id],
            connected_entry_id: next_entry_2[:id]
          }
          entry_connections << connection

          # Create inverse connection
          inverse_connection = {
            id: entry_connections.length + 1, # Generating a unique id
            entry_id: next_entry_2[:id],
            framework_id: framework[:id],
            connected_entry_id: entry[:id]
          }
          entry_connections << inverse_connection
        end
      end
    end

    # Write arrays as JSON files
    output_dir = File.expand_path(File.join(__FILE__, '../../../app/models/agile_landscape/data'))
    Dir.mkdir(output_dir) unless File.directory?(output_dir)

    File.write("#{output_dir}/entries.json", JSON.dump(entries))
    File.write("#{output_dir}/frameworks.json", JSON.dump(frameworks))
    File.write("#{output_dir}/versions.json", JSON.dump(versions))
    File.write("#{output_dir}/entry_connections.json", JSON.dump(entry_connections))
    File.write("#{output_dir}/framework_connections.json", JSON.dump(framework_connections))
  end
end