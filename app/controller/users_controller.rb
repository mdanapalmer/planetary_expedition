class UsersController < ApplicationController

	get '/signup' do 
		erb :'users/new.html'
	end

	post '/users' do
		puts "cheers"
		@user = User.create(name: params[:name], age: params[:age], 
			rank: params[:rank], email: params[:email], password: params[:password])
		session[:user_id] = @user.id
	end
end

	get '/users' do 
		if logged_in?
			@spaceships = current_user.spaceships
			@astronauts = current_user.astronauts
			erb :'users/index.html'
		end
	end