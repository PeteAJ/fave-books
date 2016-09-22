class ReadersController < ApplicationController

  




    get '/readers/:slug' do
    @reader = Reader.find_by_slug(params[:slug])
    erb :'readers/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'readers/create_reader', locals: {message: "Please sign up before you sign in"}
    else
      redirect to '/books'
    end
  end

  post '/signup' do 
    if params[:name] == "" || params[:email] == "" || params[:password_digest] == ""
      redirect to '/signup'
    else
      @reader = Reader.new(:name => params[:name], :email => params[:email], :password_digest => params[:password_digest])
      @reader.save
      session[:user_id] = @reader.id
      redirect to '/books'
    end
  end

  get '/login' do 
    if !logged_in?
      erb :'readers/login'
    else
      redirect '/books'
    end
  end

  post '/login' do
    reader = Reader.find_by(:name => params[:name])
    if reader && reader.authenticate(params[:password_digest])
      session[:user_id] = reader.id
      redirect '/books'
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end

