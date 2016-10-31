
class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String, length: 140, required: true
  property :price, Integer
  property :location, String, length: 80, required: true


end
