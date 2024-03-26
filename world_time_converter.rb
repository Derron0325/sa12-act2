require 'httparty'

def fetch_timezone_data(area, location)
  url = "http://worldtimeapi.org/api/timezone/#{area}/#{location}"
  response = HTTParty.get(url)
  timezone_data = JSON.parse(response.body)
  timezone_data
end

def display_current_time(timezone_data, area, location)
  current_datetime = timezone_data['datetime']
  puts "The current time in #{area}/#{location} is #{current_datetime}"
end

def main
  print "Enter the area: "
  area = gets.chomp
  print "Enter the location: "
  location = gets.chomp

  timezone_data = fetch_timezone_data(area, location)
  display_current_time(timezone_data, area, location)
end

main