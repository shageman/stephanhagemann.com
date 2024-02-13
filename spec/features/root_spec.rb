require "rails_helper"

RSpec.describe "Root" do
  it "displays the homepage" do
    pending "Need to implement Agile Landscape page"

    visit root_path
    expect(page).to have_content("Stephan Hagemann")

    click_link "posts"
    expect(page).to have_selector("h1", text: "Posts")

    click_link "books"
    expect(page).to have_selector("h1", text: "Books")

    click_link "speaking"
    expect(page).to have_selector("h1", text: "Speaking")

    click_link "...and more"
    expect(page).to have_selector("h1", text: "But wait there’s more!")

    expect(page).to have_selector("a", text: "Services (I can sometimes offer)")
    expect(page).to have_selector("a", text: "Tags (How I thought things could be categorized)")
    expect(page).to have_selector("a", text: "Agile Landscape")
  end
end
