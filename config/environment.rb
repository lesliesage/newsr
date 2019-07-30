# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


# require 'open-uri'

# url = 'https://newsapi.org/v2/everything?'\
#       'q=Apple&'\
#       'from=2019-07-30&'\
#       'sortBy=popularity&'\
#       'apiKey=a33f1cba57bb4354a3ae45706386005e'

# req = system("open", url)

# response_body = req.read

# puts response_body