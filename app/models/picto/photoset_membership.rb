class Picto::PhotosetMembership
  include MongoMapper::Document
  belongs_to :user
  belongs_to :photoset
end