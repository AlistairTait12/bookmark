feature "Add a bookmark" do
  scenario "User can add a new bookmark" do
    visit('/bookmarks')
    fill_in :url, with: "https://youtube.com"
    fill_in :title, with: "youtube"
    click_button 'Submit'
    expect(page).to have_content "youtube"
  end
end