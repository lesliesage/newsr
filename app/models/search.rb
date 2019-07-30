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

  # url = 'https://newsapi.org/v2/everything?q=' + search_terms + 'from=' + search_date + 'sortBy=popularity&' + API_KEY

  url = https://newsapi.org/v2/everything?q=Apple&from=2019-07-30&sortBy=popularity&apiKey=

  response = RestClient.get(url)

  json = JSON.parse(req)

  articles_hash = json[articles]



end
