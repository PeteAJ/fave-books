class SessionsController < ApplicationController



get '/registrations/signup' do
      if !logged_in?
    erb :'/registrations/signup'
  else 
    redirect to '/index'
  end
end

 post '/registrations' do
     if params[:name] == "" || params[:email] == "" || params[:password] == ""
       redirect to '/registrations/signup'
     else
      @reader = Reader.new(:name => params[:name], :email => params[:email], :password => params[:password])
       @reader.save
       session[:user_id] = @reader.id
       binding.pry
    redirect '/books'
  end
  end

get '/sessions/login' do
erb :'/sessions/login'
end

post '/sessions' do
 login(params[:email])
 redirect '/books/index'
end 

get '/sessions/logout' do 
  logout!
  redirect '/'
end

get '/books/index' do 
  erb :'/books/index.html'
end

end