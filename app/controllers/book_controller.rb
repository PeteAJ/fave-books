class BooksController < ApplicationController

def index
@books = Book.all
end

get '/books' do 
  "A list"
end

get '/books/new' do 
  if !logged_in?
    redirect '/login'
  else
    "a new book form"
  end
end

get '/books/:id/edit' do
if !logged_in?
    redirect '/login'
  else
    book = current_user.books.find(params[:id])
  "an edit book form #{current_user.id} is editing #{post.id}"
end
end


end