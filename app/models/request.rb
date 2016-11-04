class Request
  include DataMapper::Resource

  property :id, Serial

  belongs_to :user
  belongs_to :space

  property :date_from, Date
  property :date_to, Date

  property :confirmed, Boolean




  def requests_received(user)
    @requests = []
    @spaces = Space.all(user_id: user.id)
    @spaces.each { |space| @requests += Request.all(space_id: space.id) }
    @requests
  end

end
