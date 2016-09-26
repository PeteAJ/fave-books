class ReadersController < ApplicationController

    get '/readers/:slug' do
    @reader = Reader.find_by_slug(params[:slug])
    erb 'readers/show'
  end


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
    redirect '/users/home'
  end
  end

 
  get '/sessions/login' do
    if !logged_in?
    erb :'sessions/login'
  else
    redirect '/books'
  end
  end

  post '/sessions' do
     reader = Reader.find_by(:name => params[:name])
    if reader && reader.authenticate(params[:password])
      session[:user_id] = reader.id
    redirect 'users/home'
  else
    redirect to '/sessions/login'
  end
  end


  get '/sessions/logout' do 
     if session[:user_id] != nil
      session.destroy
      redirect to '/sessions/login'
    else
      redirect to '/'
    end
  end
 
end

