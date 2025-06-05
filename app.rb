require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

require "http"
require "json"

require "nokogiri"
require "open-uri"
require "uri"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  
url = "https://en.wikipedia.org/api/rest_v1/page/summary/Rock_paper_scissors"

response = URI.open(url).read
data = JSON.parse(response)

puts "Title: #{data['title']}"
puts "Summary: #{data['extract']}"
puts "Image: #{data.dig('thumbnail', 'source') || 'No image'}"

  "
  <h1>Welcome to Rock-Paper-Scissors!</h1>
  "
end

get("/play_rock") do
  @rock = 1
  @enemy = rand(1..3)

  erb(:play_rock)

end 

get("/play_paper") do
  @rock = 2
  @enemy = rand(1..3)

  erb(:play_paper)

end 

get("/play_scissors") do
  @rock = 3
  @enemy = rand(1..3)

  erb(:play_scissors)

end
