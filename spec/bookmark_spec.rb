require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: 'Makers Academy')
      Bookmark.add(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.add(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
    end
  end

  describe '.add' do
    it 'creates a bookmark' do
      bookmark = Bookmark.add(url: 'https://www.someurl.test', title: 'test')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      p bookmark.id.to_i
      p persisted_data['id']
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'test'
      expect(bookmark.url).to eq 'https://www.someurl.test'
    end
  end
end