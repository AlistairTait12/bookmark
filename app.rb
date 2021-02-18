require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello, world!'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:list)
  end

  post '/bookmarks' do
    Bookmark.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end