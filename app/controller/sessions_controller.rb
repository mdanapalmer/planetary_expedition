class SessionsController < ApplicationController

	get '/logout' do 
		logout!
		erb :'sessions/logout.html'
	end

	get '/login' do 
		erb :'sessions/login.html'
	end