require 'test_helper'

class SearchesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "cannot access search page without login" do
    # login via https
    # @user = User.create(first_name: 'first', last_name: 'last', username: 'fakeuser', password: '123')
    get "/searches"
    assert_response :redirect
  end
end
