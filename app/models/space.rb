class Space
  include DataMapper::Resource

  belongs_to :location

  property :id, Serial
  property :name, String, length: 140, required: true
  property :price, Integer, required: true

end
