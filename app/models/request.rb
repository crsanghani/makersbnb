class Request
  include DataMapper::Resource

  property :id, Serial

  belongs_to :user
  belongs_to :space

  property :date_from, Date
  property :date_to, Date

  property :confirmed, Boolean

  # def get_requests
  #   @requests = []
  #   spaces = Space.all(user_id: current_user.id)
  #   spaces.each { |space| @requests << Request.all(space_id: space.id) }
  #   @requests
  # end
  # <!-- From: <%= request.date_from %></br>
  # To: <%= request.date_to %></br>
  # Total cost: <%= (request.space.price) * (((request.date_from..request.date_to).to_a).length - 1)%></br>
  # Requested by: <%= request.user.email %> -->
end
