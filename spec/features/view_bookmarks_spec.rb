feature 'viewing bookmarks' do
  scenario 'user visits /bookmarks and can see list of bookmarks' do

    Bookmark.add(url: 'https://www.google.co.uk', title: 'Google')
    Bookmark.add(url: 'https://destroyallsoftware.com', title: 'destroyallsoftware')

    visit '/bookmarks'
    expect(page).to have_content('Google')
    expect(page).to have_content('destroyallsoftware')
  end
end