class Makersbnb < Sinatra::Base

  get '/' do
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  post '/spaces' do
    space  = Space.new(name: params[:name], price: params[:price])
    location = Location.first_or_create(name: (params[:location]).intern)
    space.location = location
    space.save
    redirect '/spaces'
  end

  get '/spaces/new' do
    haml :'spaces/new'
  end

end
