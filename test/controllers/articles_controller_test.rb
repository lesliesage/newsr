require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end


  test "cannot access articles page without login" do
    # login via https
    # @user = User.create(first_name: 'first', last_name: 'last', username: 'fakeuser', password: '123')
    get "/articles"
    assert_response :redirect
  end







end
