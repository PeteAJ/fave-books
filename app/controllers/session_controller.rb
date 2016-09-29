class SessionsController < ApplicationController



get '/login' do
erb :'/sessions/login'
end

post '/sessions' do
 session[:email] = params[:email]
 redirect '/users/home'
end 

get '/logout' do 
end


end