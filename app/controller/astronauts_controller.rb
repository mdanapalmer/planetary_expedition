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
    @astronaut = current_user.astronauts.find(params[:id])
    erb :'astronauts/edit.html'
  else
    erb :'error'
  end
end

get '/astronauts/:id' do
  if logged_in?
    @astronaut = current_user.astronauts.find(params[:id])
    erb :'astronauts/show.html'
  else
    erb :'error'
  end
end

patch '/astronauts/:id' do 
  if logged_in?
    @astronaut = current_user.astronauts.find(params[:id])
    @astronaut.update(params[:astronaut])    
    redirect to "/astronauts/#{@astronaut.id}"
  else
    redirect to "/astronauts"
  end
end

delete "/astronauts/:id" do
  if logged_in?
    current_user.astronauts.destroy(params[:id])
    redirect to "/astronauts"
  else
    redirect to "/astronauts"
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
      @astronaut = Astronaut.create(user_id: current_user.id, name: params[:name], weight: params[:weight], height: params[:height], bio: params[:bio], nationality: params[:nationality], specialty: params[:specialty], ship: params[:ship])
      erb :'astronauts/show.html'
    else
      erb :'error'
    end
end  
end