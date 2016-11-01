class Makersbnb < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/recover' do
    "Please enter your email address"
  end

  post '/users/recover' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
    end

    erb :'users/acknowledgment'
  end
end
