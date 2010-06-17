require 'test_helper'

class UserTest < Test::Unit::TestCase
  extend Test::MongoMapperMacros
  
  context "A User" do
    setup do
      @user = Factory(:user, :email => "carlos@gotama.com")
    end
    
    subject { @user }
        
    should_validate_presence_of :email

#    should "start with one chapter" do
#      assert_equal 1, @book.chapters.size
#    end
    
#    context "with chapters" do
#      setup do
#        3.times { @book.chapters << Factory(:chapter) }
#        @book.save!
#      end
#
#      subject { @book }
#
#      should_be_able_to_move_chapters(2, 0)
#      should_be_able_to_move_chapters(1, 2)
#      should_be_able_to_move_chapters(1, 1)
#    end
  end
end
