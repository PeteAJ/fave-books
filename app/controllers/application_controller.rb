require './config/environment'

class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    #set :public_folder, 'public'
    #set :views, 'app/views'
    enable :sessions
    set :session_secret, "read_secret"
  end

  get "/" do
    erb :index
  end


    get '/registrations/signup' do
      if !logged_in?
    erb :'/registrations/signup'
  else 
    redirect to '/index'
  end

  post '/registrations' do
     if params[:name] == "" || params[:email] == "" || params[:password] == ""
       redirect to '/registrations/signup'
     else
      @reader = Reader.new(:name => params[:name], :email => params[:email], :password => params[:password])
       @reader.save
       session[:user_id] = @reader.id
    redirect 'users/home'
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
    redirect to '/registrations'
  end
  end

  get '/sessions/logout' do 
    redirect '/'
  end

 get 'users/home' do
    erb :'users/home'
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
