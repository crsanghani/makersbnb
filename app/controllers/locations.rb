class Makersbnb < Sinatra::Base

  get '/locations/:name' do
    location = Location.first(name: params[:name])
    @spaces = location ? location.spaces : []
    erb :'spaces/index'
  end

end
