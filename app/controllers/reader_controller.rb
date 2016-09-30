class ReadersController < ApplicationController




 get '/readers/home' do
    if (@reader = current_reader) && @reader != nil 
      erb :'readers/home'
    else 
      redirect to '/'
    end
  end


  post '/readers' do 
    @reader = Reader.new
    @reader.email = params[:email]
    @reader.password = params[:password]
    if @reader.save 
      redirect '/login'
    else 
      redirect to '/registrations/signup'
    end
  end













 
end

