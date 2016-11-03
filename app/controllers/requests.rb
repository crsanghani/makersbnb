class Makersbnb < Sinatra::Base


  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    erb :'requests/request'
  end

  post '/requests' do

    Request.create(date_from: params[:date_from],
                    date_to: params[:date_to],
                    user_id: current_user.id,
                    space_id: params[:space])
    redirect '/requests'
  end

  get '/requests' do
    @requests_made = current_user.requests || []
    # @requests_received = get_requests(current_user)
    erb :'requests/inbox'
  end


end
