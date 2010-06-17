class User
  include MongoMapper::Document

  devise  :authenticatable, :lockable, :rememberable, :registerable, :trackable, :validatable

  timestamps!
end