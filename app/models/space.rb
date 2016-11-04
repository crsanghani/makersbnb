class Space
  include DataMapper::Resource

  belongs_to :location
  belongs_to :user

  has n, :requests

  property :id, Serial
  property :name, String, length: 140, required: true
  property :price, Integer, required: true
  property :description, Text, required: true

  property :available_from, Date
  property :available_to, Date


  # availability to a string

  	def available_from_to_s
  		if available_from.class == Date
  			available_from.strftime("%d/%m/%Y")
  		else
  			available_from
  		end
  	end

  	def available_to_to_s
  		if available_to.class == Date
  			available_to.strftime("%d/%m/%Y")
  		else
  			available_to
  		end
  	end


  # Compile available dates
	def self.available_dates(space_id)
		space = Space.first(id: space_id)
		available_dates = (space.available_from..space.available_to).map{ |date| date.strftime("%d/%m/%Y") }
		requests_made = Request.all(space_id: space_id, confirmed: true)
  	requests_made.each { |request| available_dates -= [request.date.strftime("%d/%m/%Y")] }
		available_dates
	end

  # Check if space is available on given date

	def self.is_available?(id: '', date: '')
		self.available_dates(id).include?(date)
	end

end
