require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "read_secret"
  end

  get "/" do
    erb :index
  end


    get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    
    redirect 'readers/show'
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    redirect 'readers/show'
  end

  get '/sessions/logout' do 
    redirect '/'
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_reader
      Reader.find(session[:user_id])
    end

  end

end
