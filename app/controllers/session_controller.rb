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
       redirect to '/failure'
     else
      @reader = Reader.new(:name => params[:name], :email => params[:email], :password => params[:password])
       @reader.save
       session[:user_id] = @reader.id
       #binding.pry
    redirect '/books/new'
  end
  end

get '/sessions/login' do
erb :'/sessions/login'
end

post '/sessions' do
  reader = Reader.find_by(:name => params[:name])
		if reader && reader.authenticate(params[:password])
			session[:user_id] = user.id
 login(params[:email],[:password])
 redirect '/books/index'
 else
   redirect '/failure'
 end
end

get "/failure" do
    erb :'/sessions/failure'
  end

get '/sessions/logout' do
  logout!
  redirect '/'
end

get '/books/index' do
  redirect '/books/index'
end

end
