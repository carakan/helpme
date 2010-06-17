class Picto::Providers::Facebook < Picto::Media
  key :facebook, String, :required => true

  
  def media
    self.facebook
  end

  
end
