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
    if logged_in?
    	@astronaut = Astronaut.find(params[:id])
    	erb :'astronauts/edit.html'
  	else
      erb :'error'
    end
end

get '/astronauts/:id' do
    if logged_in?
    	@astronaut = Astronaut.find(params[:id])
    	erb :'astronauts/show.html'
    else
      erb :'error'
    end
end