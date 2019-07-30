class Search < ApplicationRecord
  belongs_to :search_term
  # require 'open-uri'
  # url = 'https://newsapi.org/v2/everything?'\
  #       'q=Apple&'\
  #       'from=2019-07-30&'\
  #       'sortBy=popularity&'\
  #       'apiKey='
  # req = RestClient(url)
  # response_body = req.read
  # puts response_body
  # url = https://newsapi.org/v2/everything?q=Apple&from=2019-07-30&sortBy=popularity&apiKey=

  def format_terms(search_entered)
    search_entered.gsub(" ","%20")
  end

  def articles_hash(search_terms, search_date)
    url = "https://newsapi.org/v2/everything?q=#{search_terms}&from=#{search_date}&sortBy=popularity&apiKey=&#{API_KEY}"
    response = RestClient.get(url)
    json = JSON.parse(req)
    json[articles]
  end

  def print_article

  end

end
