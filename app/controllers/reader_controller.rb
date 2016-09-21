class ReadersController < ApplicationController

  #Index Controller
  get "/readers" do
    erb :"/readers/index.html"
  end

  # New Item Controllers
  get "/readers/new" do
    erb :"/readers/new.html"
  end

  post "/readers" do
    redirect "/readers"
  end

  # Show Item Controller
  get "/readers/:id" do
    erb :"/readers/show.html"
  end

  # Edit Item Controller
  get "/readers/:id/edit" do
    erb :"/readers/edit.html"
  end

  patch "/readers" do
    redirect "/readers/:id"
  end

  # Delete Item Controller
  delete "/readers/:id/delete" do
    redirect "/readers"
  end



    get '/readers/:slug' do
    @reader = reader.find_by_slug(params[:slug])
    erb :'readers/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'readers/create_reader', locals: {message: "Please sign up before you sign in"}
    else
      redirect to :'/books/index'
    end
  end

  post '/signup' do 
    if params[:readername] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @reader = reader.new(:readername => params[:readername], :email => params[:email], :password => params[:password])
      @reader.save
      session[:reader_id] = @reader.id
      redirect to :'/books/index'
    end
  end

  get '/login' do 
    if !logged_in?
      erb :'readers/login'
    else
      redirect '/tweets'
    end
  end

  post '/login' do
    reader = reader.find_by(:readername => params[:readername])
    if reader && reader.authenticate(params[:password])
      session[:reader_id] = reader.id
      redirect "/tweets"
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
