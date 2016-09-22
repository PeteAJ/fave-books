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


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_reader
      Reader.find(session[:user_id])
    end

  end

end
