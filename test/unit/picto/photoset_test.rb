require 'test_helper'

class Picto::PhotosetTest < Test::Unit::TestCase
  extend Test::MongoMapperMacros
  
  context "A Photoset" do
    setup do
      #@photoset = Factory(:'picto/photoset')
      @photoset = Picto::Photoset.new({ :title => 'photoset'  })
    end
    
    subject { @photoset }
        
    should_validate_presence_of :title

    should "correct add 3 diferent providers" do
      #TODO set this method with callback on save
      values = {:oembed => 'Picto::Providers::Oembed',
        :facebook => 'Picto::Providers::Facebook',
        :photo => 'Picto::Providers::Photo'}.collect { |key, value| @photo = value.constantize.create({:title => "media #{key}",:"#{key}" => "#{key}"})}


      @photoset.picto_medias = values
      
      assert_equal @photoset.picto_medias.length, 3
    end

  end
end
