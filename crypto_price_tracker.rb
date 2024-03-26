require 'httparty'

def fetch_cryptocurrency_data
  url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
  response = HTTParty.get(url)
  cryptocurrency_data = JSON.parse(response.body)
  cryptocurrency_data
end

def sort_by_market_cap(cryptocurrency_data)
  cryptocurrency_data.sort_by { |crypto| crypto['market_cap'] }.reverse
end

def display_top_cryptocurrencies(cryptocurrency_data, count)
  puts "Top #{count} Cryptocurrencies by Market Capitalization:"
  cryptocurrency_data.first(count).each do |crypto|
    puts "#{crypto['name']}:"
    puts "Price: $#{crypto['current_price']}"
    puts "Market Cap: $#{crypto['market_cap']}"
    puts "--------------------------------------"
  end
end

def main
  cryptocurrency_data = fetch_cryptocurrency_data
  sorted_cryptocurrency_data = sort_by_market_cap(cryptocurrency_data)
  display_top_cryptocurrencies(sorted_cryptocurrency_data, 5)
end

main