class BooksController < ApplicationController



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
    book = Reader.fin(params[:id])
    "an edit book form #{current_user.id} is editing #{post.id}"
  end
end


end
