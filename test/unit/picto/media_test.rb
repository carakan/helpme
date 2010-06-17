require 'test_helper'

class Picto::MediaTest < Test::Unit::TestCase
  extend Test::MongoMapperMacros
  
  {:oembed => 'Picto::Providers::Oembed',
    :facebook => 'Picto::Providers::Facebook',
    :photo => 'Picto::Providers::Photo'}.each do |key, value|
    context "A Media in #{value}" do
      setup do
        @photo = value.constantize.create({:title => "media #{key}",
                                             :"#{key}" => "#{key}"})
      end
      subject { @photo }
      should_validate_presence_of :"#{key}"

      should "save correct class name in #{key}" do
        #TODO set this method with callback on save
        @photo.set_class_name
        
        assert_equal value, @photo.class_provider
        assert_equal "media #{key} #{value} #{key}", @photo.to_s
      end
    end
  end
end
