class ReadersController < ApplicationController

get '/readers' do
  @readers = Reader.all
  erb :'readers/index'
end

  get 'readers/new' do
    erb ':readers/new'
  end

  post 'readers' do
    @reader = Reader.create(params[:reader])
    if !params["book"]["title"].empty?
      @reader.books << Book.create(name: params["book"]["title"])
    end
    @reader.save
    redirect "readers/#{@reader.id}"
end

#get '/readers/:id/edit' do #open edit view
#  @reader = Reader.find(params[:id])
#  erb :'/readers/edit'
#end

#get '/readers/:id' do #open show view
#  @reader - Reader.find(params[:id])
#  erb :'/readers/show'
#end

post '/readers/:id' do
  @reader = Reader.find(params[:id])
  @reader.update(params["reader"])
  if !params["book"]["title"].empty?
    @reader.pets << Reader.create(name: params["book"]["title"])
  end
  redirect "readers/#{@reader.id}"
end



    #if (@reader = current_reader) && @reader != nil



  #post '/readers' do
  #  @reader = Reader.new
  #  @reader.email = params[:email]
  #  @reader.password = params[:password]
  #  if @reader.save
  #    redirect '/login'
  #  else
  #    redirect to '/registrations/signup'
  #  end
#  end














end
