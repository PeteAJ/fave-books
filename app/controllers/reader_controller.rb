class ReadersController < ApplicationController

get '/readers/new' do #loads new form
  if !logged_in?
    redirect '/login'
  else
    "a new book form"
  erb :'readers/new'
  end

end

post '/readers' do  #creates a book
  @reader = Reader.create(params)
  redirect to '/readers'
end

get '/readers' do #loads index page
  @readers = Reader.all
  "a list"
  if logged_in?
    erb :'/books/index.html'
  else
    redirect to '/sessions/login' 
  end
end

get '/readers/:id' do  #loads show page
  @reader = Reader.find_by_id(params[:id])
  erb :'/readers/show.html'
end





end
