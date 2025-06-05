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
 
  erb(:elephant)
end

get("/rock") do
  @rock = 1
  @enemy = rand(1..3)

  erb(:rock)

end 

get("/paper") do
  @rock = 2
  @enemy = rand(1..3)

  erb(:paper)

end 

get("/scissors") do
  @rock = 3
  @enemy = rand(1..3)

  erb(:scissors)

end
