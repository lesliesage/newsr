require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "Person can add article to favorites" do
    user = User.all.sample
    article = Article.all.sample
    x = user.articles.count
    y = user.articles << article
    y  = y.count
    assert(y > x)
  end


end
