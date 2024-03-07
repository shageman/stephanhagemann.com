require "net/http"
require "json"

namespace :agile_landscape do
  desc "Query OpenAI API"
  task openai: :environment do
    limit = ENV["LIMIT"]&.to_i || 3
    offset = ENV["OFFSET"]&.to_i || 0

    puts "limit #{limit}, offset #{offset}"
    input_array = AgileLandscape::FrameworkConnection.all.to_a
    output_array = []

    input_array[offset, limit].each do |input|
      name = input.entry.name
      context = input.framework.name

      prompt = "Describe what **#{name}** is about in **#{context}**. Give the text more structure by outputting it in markdown. Add links to the three best resources on the topic at the end."

      result = query_openai_api(prompt)

      result =  {
        id: output_array.length + 1 + offset,
        framework_connection_id: input.id,
        prompt: prompt,
        created_at: Time.now,
        author: "OpenAI gpt-3.5-turbo",
        result: result
      }
      puts result.to_json
      output_array << result

      sleep 20
    end

    puts output_array.inspect # Print the output array for debugging purposes
    # You can also save output_array to your database or export it to a file
  end

  def query_openai_api(prompt)
    uri = URI("https://api.openai.com/v1/chat/completions")
    req = Net::HTTP::Post.new(uri)
    req["Authorization"] = "Bearer #{Rails.application.credentials.dig(:openai, :api_key)}"
    req["Content-Type"] = "application/json"
    req.body = "
    {
    \"model\": \"gpt-3.5-turbo\",
    \"messages\": [
      {
        \"role\": \"system\",
        \"content\": \"You are an expert on Agile software development practices.\"
      },
      {
        \"role\": \"user\",
        \"content\": \"#{prompt}\"
      }
    ]
  }"

    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end

    JSON.parse(res.body)["choices"][0]["message"]["content"] if res.is_a?(Net::HTTPSuccess)
  end
end
