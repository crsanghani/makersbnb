class Makersbnb < Sinatra::Base

  get '/about' do
    erb :'about/about'
  end
  
end
