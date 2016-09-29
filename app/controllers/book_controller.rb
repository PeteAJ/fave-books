class BooksController < ApplicationController



get '/books' do 
  "You are logged in as #{session[:email]}"
end

get '/books/new' do 
  if !session[:email]
    redirect '/login'
  else
    "a new book form"
  end
end

get '/books/:id/edit' do
if !session[:email]
    redirect '/login'
  else
    "an edit book form"
  end
end


end
