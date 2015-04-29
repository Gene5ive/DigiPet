require('capybara/rspec')
require('./app')
require 'pry'
set(:show_exceptions, false)

Capybara.app = Sinatra::Application

describe('the DigiPet action path', {:type => :feature}) do
  it('processes the user entry and returns a confirmation') do
    visit('/')
    fill_in('action', :with => 'feed')
    click_button('Take Action')
    expect(page).to have_content('Action Taken!')
  end
end
