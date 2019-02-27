class SpaceshipsController < ApplicationController

# new
  get '/spaceships/new' do
    if logged_in?
      erb :'spaceships/new.html'
    else
      erb :'error'
    end
  end

  # show
  get "/spaceships/:id" do  
    if logged_in?
      @spaceship = current_user.spaceships.find(params[:id])
      erb :'spaceships/show.html'
    else
      erb :'error'
    end
  end

  # edit
  get '/spaceships/:id/edit' do
    if logged_in?
      @spaceship = current_user.spaceships.find(params[:id])
      erb :'spaceships/edit.html'
    else
      erb :'error'
    end
  end

  # index
  get '/spaceships' do
    if logged_in?
      @spaceships = current_user.spaceships     
      erb :'spaceships/index.html'
    else
      erb :'error'
    end
  end

  # create
  post '/spaceships' do
    if logged_in?
      @astronaut = current_user.astronauts.find_by(params[:spaceship][:crew_member])
      @spaceship = Spaceship.create(user_id: current_user.id, name: params[:name], ship_type: params[:ship_type], speed: params[:speed], cargo: params[:cargo], crew_member: @astronaut.name)
      erb :'spaceships/show.html'
    else
      erb :'error'
    end  
  end

  # update
  patch '/spaceships/:id' do
    if logged_in?
      @spaceship = current_user.spaceships.find(params[:id])
      @spaceship.update!(params[:spaceship])
      redirect to "/spaceships/#{@spaceship.id}"
    else
      erb :'error'
    end
  end

  #destroy
  delete "/spaceships/:id" do
    if logged_in?
      current_user.spaceships.destroy(params[:id])
      redirect to "/spaceships"
    else
      erb :'error'
    end
  end
end