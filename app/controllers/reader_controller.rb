class ReadersController < ApplicationController


get '/signup' do
  erb :'/registrations/signup'
end



  post '/readers' do 
    @reader = Reader.new
    @reader.email = params[:email]
    @reader.password = params[:password]
    if @reader.save 
      redirect '/login'
    else 
      erb :'/registrations/signup'
    end
  end













 
end

