require('capybara/rspec')
require('./app')
require('pry')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path to creating a band', {:type => :feature}) do
  it('allows user to add a band to the databse') do
    visit('/')
    click_link('View list of bands/add a new band!')
    fill_in('name', :with => 'nirvana')
    click_button('Add Band')
    expect(page).to have_content('Nirvana')
  end
end
