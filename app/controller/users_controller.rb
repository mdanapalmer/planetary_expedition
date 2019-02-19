class UsersController < ApplicationController

	get '/signup' do 
		erb :'users/new.html'
	end

	get '/users' do 
		if logged_in?
			@spaceships = current_user.spaceships
			@astronauts = current_user.astronauts
			erb :'users/index.html'
		end
	end

	# get '/user' do
	# 	binding.pry
	# 	User.find(session[:user_id])
	# 	if current_user.id == @user.id
	# 		redirect '/users/#{@user.id}/show'
	# 	else
	# 		erb :'error'
	# 	end
	# end

	post '/users' do
		@user = User.create!(name: params[:name], age: params[:age], 
			rank: params[:rank], email: params[:email], password: params[:password])
				binding.pry
		session[:user_id] = @user.id	
	end
end
