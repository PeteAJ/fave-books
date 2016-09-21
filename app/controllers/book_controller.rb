class BooksController < ApplicationController

   get '/books' do
    if logged_in?
      @books = Book.all
      erb :'books/show'
    else
      redirect to '/login'
    end
  end

  #Index Controller
  get "/books" do
    erb :"/books/index.html"
  end

  # New Item Controllers
  get "/books/new" do
    erb :"/books/new.html"
  end

  post "/books" do
    redirect "/books"
  end

  # Show Item Controller
  get "/books/:id" do
    erb :"/books/show.html"
  end

  # Edit Item Controller
  get "/books/:id/edit" do
    erb :"/books/edit.html"
  end

  patch "/books" do
    redirect "/books/:id"
  end

  # Delete Item Controller
  delete "/books/:id/delete" do
    redirect "/books"
  end
end
