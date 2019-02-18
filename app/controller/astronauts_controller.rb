class AstronautsController < ApplicationController
  
get '/astronauts/new' do
    if logged_in?
      @astronaut = Astronaut.new
      erb :'astronauts/new.html'
    else
      erb :'error'
    end
end

get '/astronauts/:id/edit' do
    if  logged_in?
    	@astronaut = Astronaut.find(params[:id])
    	erb :'astronauts/edit.html'
  	else
        erb :'error'
    end
end

get '/astronauts/:id' do
    if  logged_in?
    	@astronaut = Astronaut.find(params[:id])
    	erb :'astronauts/show.html'
    else
        erb :'error'
    end
end

  patch '/astronauts/:id' do 
    if logged_in?
    	@astronaut = Astronaut.find(params[:id])
    	@astronaut.update(params[:astronaut])    
    	redirect to "/astronauts/#{@astronaut.id}"
    else
        erb :'error'
    end
end

  delete "/astronauts/:id" do
    if logged_in?
    	Astronaut.destroy(params[:id])
    	redirect to "/astronauts"
    else
        erb :'error'
    end
end

get "/astronauts" do
  	if logged_in?
 		@astronauts = current_user.astronauts  
 		erb :'astronauts/index.html'
 	else
        erb :'error'
    end
end 

post "/astronauts" do
    if logged_in?
    	@astronaut = Astronaut.create(params)
        
    	erb :"/astronauts/show.html"
    else
      erb :'error'
    end
end  

end