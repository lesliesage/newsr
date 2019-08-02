require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get '/login'
    assert_response :success
  end

  test "should get create" do
    post '/login'
    assert_response :success
  end
end
