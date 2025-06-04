require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
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
