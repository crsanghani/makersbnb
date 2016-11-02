class Location
  include DataMapper::Resource

  has n, :spaces

  property :id, Serial
  property :name, String, length: 58, required: true

end
