class Request
  include DataMapper::Resource

  property :id, Serial

  belongs_to :user
  belongs_to :space

  property :date_from, Date
  property :date_to, Date

  def request_dates
    @dates_requested = (self.date_from..self.date_to).to_a
    @dates_requested.each do |date|
      if !self.space.dates_available.include?(date)
        return Error "Dates not available. Check again, mortal!"
      else
        request_confirm_dates(@dates_requested, self.user_id, )
      end
    end
  end

  def request_confirm_dates

  end

  def confirm_dates
    self.space.dates_available - @dates_requested
  end

  def get_requests(user)
      @requests = []
      spaces = Space.all(user_id: user.id)
      spaces.each { |space| @requests << Request.all(space_id: space.id) }
      @requests
  end

end
