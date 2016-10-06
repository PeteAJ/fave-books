class BooksController < ApplicationController


get '/books/:id/edit' do
if !logged_in?
    redirect '/login'
  else
    book = current_user.books.find(params[:id])
  "an edit book form #{current_user.id} is editing #{post.id}"
end
end


get '/books/new' do #loads new form
  if !logged_in?
    redirect '/login'
  else
    "a new book form"
  redirect '/books/new'
  end

end

post '/books' do  #creates a book
  @book = Book.create(params)
  redirect to '/books'
end

get '/books' do #loads index page
  @books = Book.all
  "a list"
  erb :'/books/index.html'
end

get '/books/:id' do  #loads show page
  @book = Book.find_by_id(params[:id])
  erb :'/books/show.html'
end

get '/books/:id/edit' do #loads edit form
  @book = Book.find_by_id(params[:id])
  erb :'/books/edit.html'
end

post '/books/:id' do  #updates a book
  @book = Book.find_by_id(params[:id])
  @book.author = params[:author]
  @book.title = params[:title]
  @book.year = params[:year]
  @book.notes = params[:notes]
  @book.save
  erb :'/books/show.html'
end


post '/books/:id/delete' do #delete action
  @book = Post.find_by_id(params[:id])
  @book.delete
  erb :'/books/index.html'
end







end
