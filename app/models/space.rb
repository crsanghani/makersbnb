class Space
  include DataMapper::Resource

  belongs_to :location

  property :id, Serial
  property :name, String, length: 140, required: true
  property :price, Integer, required: true
  property :description, Text, required: true

  property :available_from, Date
  property :available_to, Date

end
