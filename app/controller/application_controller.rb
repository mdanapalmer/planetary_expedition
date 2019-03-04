class ApplicationController < Sinatra::Base

configure do
  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  register Sinatra::Flash
  set :session_secret, "ad_astra"
end

get '/' do
  erb :index
end

get '/error' do
  erb :error
end

  helpers do

    def logout!
      session.clear
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end