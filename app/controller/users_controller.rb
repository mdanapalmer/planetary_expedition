require 'sinatra/base'
require 'sinatra/flash'

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

  post '/users' do
    @user = User.new(params)
    @user.save
    if @user.valid?
      session[:user_id] = @user_id
      redirect '/'
    else
      flash.now[:notice] = 'Email and/or Password fields cannot be blank.  Email must not already be taken.'
    end
  end
end