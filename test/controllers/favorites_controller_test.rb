require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "cannot favorite favorites without login" do
    get '/favorites/:id'
    assert_response :redirect
  end




end
