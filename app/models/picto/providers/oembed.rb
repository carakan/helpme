class Picto::Providers::Oembed < Picto::Media
  key :oembed, String, :required => true
  def media
    self.oembed
  end
end
