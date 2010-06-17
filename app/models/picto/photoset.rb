class Picto::Photoset 
  include MongoMapper::Document

  key :title, String
  key :description, String
  key :user_id, String

  IS_PUBLIC  = 0
  IS_FRIENDS = 1
  IS_PRIVATE = 2

  validates_presence_of :title

  # For now i disable some functions
  #acts_as_taggable
  #acts_like_comments

  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  belongs_to :main_photo, :class_name => "Picto::Media", :foreign_key => "main_photo_id"

  many :'picto_medias', :class_name => "Picto::Media"

  #accepts_nested_attributes_for :photos, :allow_destroy => true

  many   :memberships, :class_name => "Picto::PhotosetMembership"
  many   :members, :class_name => "User", :through => :memberships, :source => :user

  
  #seo_urls "title"

  #named_scope :limit_to, lambda{|limit| {:order => "created_at DESC", :limit => limit, :include => [:main_photo, :owner]}}

  #named_scope :events, lambda{|event| {:conditions => ['entrada_event_id = ? OR fraternidad_event_id = ?', event, event], :order => 'id DESC'}}
  

  def authorized(user, permission=:all)
    case permission
    when :read
      authorized_read(user)
    when :write
      authorized_write(user)
    when :destroy
      authorized_destroy(user)
    when :all
      authorized_all(user)
    end
  end

  def authorized_read(user)
    case self.privacy
    when IS_PUBLIC
      return true
    when IS_FRIENDS
      return self.owner.profile.friends.include?(user)
    when IS_PRIVATE
      return self.owner == user
    end
  end

  def authorized_write(user)
    return self.owner == user
  end

  def authorized_destroy(user)
    return self.owner == user
  end

  def authorized_all(user)
    authorized_read(user) && authorized_write(user) && authorized_destroy(user)
  end
  
  def creation_date(format=:short)
    I18n.l(self.created_at, :format => format)
  end  

  def number_of_photos
    photos.length
  end


end