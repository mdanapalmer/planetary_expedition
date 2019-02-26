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
			@spaceship = Spaceship.find(params[:id])
		erb :'spaceships/show.html'
		else
		erb :'error'
	end
end

		# edit
	get '/spaceships/:id/edit' do
		if logged_in?
			@spaceship = Spaceship.find(params[:id])
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
			@spaceship = Spaceship.create(params[:spaceship])
			@spaceship.user_id = current_user.id
		erb :'spaceships/show.html'
		else
		erb :'error'
	end  
end

	# update
	patch '/spaceships/:id' do
		if logged_in?
			@spaceship = Spaceship.find(params[:id])
			@spaceship.update!(params[:spaceship])
		redirect to "/spaceships/#{@spaceship.id}"
		else
		erb :'error'
	end
end

	#destroy
	delete "/spaceships/:id" do
		if logged_in?
		Spaceship.destroy(params[:id])
		redirect to "/spaceships"
	else
		erb :'error'
	end
end

end