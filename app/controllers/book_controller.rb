class BooksController < ApplicationController

  #Index Controller
   get '/books' do
    if logged_in?
      @books = Book.all
      erb :'books/index'
    else
      redirect to '/login'
    end
  end


get '/login' do
erb :'/sessions/login'
end

  # New Item Controllers
  get "/books/new" do
    if logged_in?
    erb :'/books/new'
  else
    redirect to '/login'
  end
  end

  post "/books" do

     if params[:author] == ""
      redirect to "/books/new"
    else
      current_user.books.create(author: params[:author])
      redirect to "/books/#{@book.id}"
    end
    #redirect "/books"
  end

  # Show Item Controller
  get "/books/:id" do
    if logged_in?
      @book = Book.find_by_id(params[:id])
    erb :'/books/show'
  else
    redirect to '/login'
  end
end

  # Edit Item Controller
  get "/books/:id/edit" do
    if logged_in?
      @book = Book.find_by_id(params[:id])
      if @book.user_id == current_user.id
    erb :'/books/edit'
  else
    redirect to '/books'
  end
  else 
    redirect to '/login'
  end
  end

  patch "/books/:id" do
    if params[:author] == ""
    redirect to "/books/#{params[:id]}/edit"
  else
    @book = Book.find_by_id(params[:id])
    @book.author = params[:author]
    -@book.title = params[:title]
    @book.save
    redirect to "/books/#{@book.id}"
  end
  end

  # Delete Item Controller
  delete "/books/:id/delete" do
    if logged_in?
      @book = Book.find_by_id(params[:id])
      if @book.user_id == current_user.id
        @book.delete
        redirect to '/books'
      else 
        redirect to '/books'
      end
    else
      redirect to '/login'
    end
  end
end
