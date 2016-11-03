class Makersbnb < Sinatra::Base

  get '/about' do
    erb :'about/about'
  end

  get '/about' do
    erb :'about/founders'
  end

end
