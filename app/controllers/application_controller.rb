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
    erb :index
  end

 
def index
@books = Book.all
end

  helpers do
    
    def logged_in?
      !!current_reader
    end

     def current_reader #=> nil
      @current_reader ||= Reader.find_by_id(session[:user_id])
      #Reader.find_by_id(session[:user_id])
    end

    def login(email, password)
      reader = Reader.find_by(:email => email)
      if reader && reader.authenticate(password)
      session[:email] = reader.email
    else
      redirect '/sessions/login'
    end
end

def logout!
  session.clear
end


   
  end

end
