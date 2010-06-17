class Picto::Media 
  include MongoMapper::Document
  
  key :class_provider, String, :required => true
  key :title, String, :required => true
  key :description, String
  key :photoset_id, String
  timestamps!

  before_save :set_class_name

  before_update :update_position

  #acts_like_comments
  #seo_urls "title"
  #acts_as_taggable
  #acts_as_list :scope => :photoset#, :class_name => "Picto::Photoset"

  

  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"

  #record_activity_of :owner

  belongs_to :photoset, :class_name => "Picto::Photoset"
  #named_scope :public, :joins => "INNER JOIN photosets ON photosets.id = photos.photoset_id",:conditions => ['photosets.privacy = 0']
  #named_scope :limit_to, lambda{|limit| {:order => "created_at DESC", :limit => limit, :include => :owner}}

  def creation_date(format=:short)
    I18n.l(self.created_at, :format => format)
  end

  #  def validate
  #    if self.image_file_name.nil?
  #      self.errors.add(:descripcion, "Tiene que elegir una foto o video.")
  #    end
  #  end

  def to_s
    "#{self.title} #{self.class_provider} #{self.media}"
  end

  #TODO add handle before save
  def set_class_name
    self.class_provider = self.class.name
  end
  
  private
  def update_position
    add_to_list_bottom if position.nil? || photoset_id != Picto::Photo.find(self.id).photoset_id
  end

end