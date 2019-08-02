require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should redirect when trying access search w/o logging in" do
    post '/users/search'
    assert_redirected_to '/login'
  end
end
