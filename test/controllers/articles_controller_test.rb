require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  before :each do
    @user = 
  end
  
  it "Logs in with valid data" do
    visit(login_path(@user)) # gets redirected to the login path
    fill_in 'email', with: 'kiran@gmail.com'
    fill_in 'password', with: 'Kiran.6565'
    click_button('submit')
  
    expect(page).to have_current_path(patient_detail_path(@patient))
  end
  

  test "get article show page" do
    get '/articles/1'
    assert_response :success
  end


end
