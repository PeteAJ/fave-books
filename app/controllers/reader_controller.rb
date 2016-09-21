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
end
