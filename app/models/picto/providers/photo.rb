class Picto::Providers::Photo < Picto::Media
  key :photo, String, :required => true

  def media
    self.photo
  end
end
