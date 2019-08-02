require 'rails_helper'
RSpec.describe "Sessions" do
  it "signs user in and out" do
    user = create(:user)
    # user = create(:user)    ## uncomment if using FactoryBot
    # user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
    user = User.create(first_name: 'first', last_name: 'last', username: 'fakeuser', password: '123')
    sign_in user
    get root_path
    expect(response).to render_template(:homepage) # add gem 'rails-controller-testing' to your Gemfile first.
    
    sign_out user
    get root_path
    expect(response).not_to render_template(:index) # add gem 'rails-controller-testing' to your Gemfile first.
  end
end