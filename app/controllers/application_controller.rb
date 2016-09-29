require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "read_secret"
  end

  get "/" do
    "Hello World"
    #erb :index
  end

  get '/readers/home' do
    if (@reader = current_reader) && @reader != nil 
      erb :'readers/home'
    else 
      redirect to '/'
    end
  end

  helpers do
    def logged_in?
      !!session[:email]
    end

    def login(email, password)
      reader = Reader.find_by(:email => email)
      if reader && user.authenticate(password)
      session[:email] = reader.email
    else
      redirect '/login'
    end
end

def logout!
  session.clear
end


    def current_reader
      # @current_reader ||= Reader.find_by_id(session[:user_id])
      Reader.find_by_id(session[:user_id])
    end
  end

end
