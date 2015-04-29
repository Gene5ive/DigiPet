require('sinatra')
require('sinatra/reloader')
require('./lib/digipet')
also_reload('lib/**/*.rb')
require 'pry'

get('/') do
  @pet = DigiPet.new("Booger")
  @pet_name = @pet.name
  erb(:index)
end

post('/actions') do
  pet_action = params.fetch('action')
  case
  when pet_action == 'feed'
    DigiPet.feed
  when pet_action == 'sleep'
    DigiPet.go_sleep
  when pet_action == 'play'
    DigiPet.play
  end
  erb(:success)
end
