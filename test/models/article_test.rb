require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "favorites" do
   user = User.all.sample
   
   assert_not_nil(user.favorites)
  end


  


end
