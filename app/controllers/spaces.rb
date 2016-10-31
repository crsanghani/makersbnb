class Makersbnb < Sinatra::Base

get '/' do
  redirect '/spaces'
end

get '/spaces' do
  @spaces = Space.all
  haml :'spaces/index'
end


end
