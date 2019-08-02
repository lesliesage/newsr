require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  # before :each do
  #   @user = User.new(username: 'fakeuser', password: '123')
  # end
  
  # test "Create new user with valid data" do
  #    get signup_path(@user) # gets redirected to the login path
  #   fill_in 'first_name', with: 'fake'
  #   fill_in 'last_name', with: 'user'
  #   fill_in 'username', with: '@username.usernmae'
  #   fill_in 'password', with: '123'
  #   click_button('Create User')
  
  #   expect(page).to qr_path(@user)
  # end
  
  # test "should get index" do
  #   get '/articles/1'
  #   assert_response :success
  #   assert_not_nil assigns(:posts)
  # end


  # test "get article show page" do
  #   get '/articles/1'
  #   assert_response :success
  # end

  test "login and browse site" do
    # login via https
    @user = User.create(first_name: 'first', last_name: 'last', username: 'fakeuser', password: '123')
    get "/signup"
    assert_response :success
 
    post "/signup", first_name: 'first', last_name: 'last', username: 'fakeuser', password: '123'
    assert_response :success
    # https!(false)
    # get "/posts/all"
    # assert_response :success
    # assert assigns(:posts)
  end




end
