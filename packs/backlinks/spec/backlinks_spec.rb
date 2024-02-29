# typed: false
require "rails_helper"

RSpec.describe Backlinks do
  it "returns an empty string for a path that hasn't been registered" do
    expect(Backlinks::Api.backlinks_for("something")).to eq ""
  end

  it "returns HTML linking back to the source site if a link was registered" do
    Backlinks::Api.register_links_for("source_path", "source_name", ["destination_path1", "destination_path2"])

    expected_backlink_text = '<section class="flow">
  <h2>Backlinks</h2>
  <ul class="backlinks-container">
<li class=\'backlink\'><a href=\'source_path\' class=\'backlink__link\'>source_name</a></li>    </ul>
</section>
'
    expect(Backlinks::Api.backlinks_for("destination_path1")).to eq expected_backlink_text
    expect(Backlinks::Api.backlinks_for("destination_path2")).to eq expected_backlink_text
  end

  it "returns HTML linking back to the source site if a link was registered" do
    Backlinks::Api.register_links_for("source_path3", "source_name3", ["destination_path3"])
    Backlinks::Api.register_links_for("source_path4", "source_name4", ["destination_path3"])

    expect(Backlinks::Api.backlinks_for("destination_path3")).to eq '<section class="flow">
  <h2>Backlinks</h2>
  <ul class="backlinks-container">
<li class=\'backlink\'><a href=\'source_path3\' class=\'backlink__link\'>source_name3</a></li><li class=\'backlink\'><a href=\'source_path4\' class=\'backlink__link\'>source_name4</a></li>    </ul>
</section>
'
  end

  it "register_links_for returns an error if the given tag is unacceptable" do
    add_result = Backlinks::Api.register_links_for("", "", [""])

    expect(add_result.message).to include('source_path=>["can\'t be blank"')
    expect(add_result.message).to include("source_title=>[\"can't be blank\"")
    expect(add_result.message).to include("destination_path=>[\"can't be blank\"")
  end
end
