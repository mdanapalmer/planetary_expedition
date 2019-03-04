class SessionsController < ApplicationController

get '/logout' do 
  logout!
  erb :'sessions/logout.html'
end

get '/login' do 
  erb :'sessions/login.html'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to '/'
  else
    erb :'error'
  end
end
end