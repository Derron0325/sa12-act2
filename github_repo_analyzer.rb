require 'httparty'

def fetch_repositories(username)
  url = "https://api.github.com/users/#{username}/repos"
  response = HTTParty.get(url)
  repositories = JSON.parse(response.body)
  repositories
end

def find_most_starred_repository(repositories)
  most_starred_repo = repositories.max_by { |repo| repo['stargazers_count'] }
  most_starred_repo
end

def display_repository_details(repository)
  puts "Name: #{repository['name']}"
  puts "Description: #{repository['description']}"
  puts "Stars: #{repository['stargazers_count']}"
  puts "URL: #{repository['html_url']}"
end

def main
  print "Enter GitHub username: "
  username = gets.chomp

  repositories = fetch_repositories(username)
  most_starred_repository = find_most_starred_repository(repositories)
  
  puts "\nMost Starred Repository:"
  display_repository_details(most_starred_repository)
end

main