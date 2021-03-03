require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, SecureRandom.hex(64)
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    if session[:user_id]
      redirect to '/tweets/index'
    else
      erb :signup
    end
  end

  post '/signup' do
    if !params.values.any? {|v| v.empty?}
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect to '/tweets/index'
    else
      redirect to '/signup'
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    
  end

  get '/tweets/index' do
  end

end
