require 'json'

class Makersbnb < Sinatra::Base

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    session[:space_id] = @space.id
    erb :'requests/request'
  end

  post '/requests' do

    Request.create(date_from: params[:date_from],
                    date_to: params[:date_to],
                    user_id: current_user.id,
                    space_id: session[:space_id])
    redirect '/requests'
  end

  get '/requests' do
    @requests_made = current_user.requests || []
    @requests_received = []
    @spaces = Space.all(user_id: current_user.id)
    @spaces.each { |space| @requests_received += Request.all(space_id: space.id) }
    @requests_received
    erb :'requests/inbox'
  end

  # Feeds json array of available dates into the datepicker
  get '/requests/available_dates' do
  	dates = Space.available_dates(session[:space_id])
  	{availableDates: dates}.to_json
  end


end
