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

describe('path to creating a venue', {:type => :feature}) do
  it('allows user to add a venue to the databse') do
    visit('/venues')
    fill_in('description', :with => 'stadium')
    click_button('Add Venue')
    expect(page).to have_content('New Venue Added!')
  end
end

describe('path to updating/delete a band', {:type => :feature}) do
  it('allows a user to update a band\'s name') do
    Band.create(name: 'nirvana')
    visit('/bands')
    fill_in('band_new_name', :with => 'Pink floyd')
    click_button('Update')
    expect(page).to have_content('Pink floyd')
  end
  it('allows a user to delete a band') do
    Band.create(name: 'Pink floyd')
    visit('/bands')
    click_button('Delete')
    expect(page).to_not have_content('Pink floyd')
  end
end

describe('path to assigning a venue to a band', {:type => :feature}) do
  it('allows a user to assign a venue/venues to a particular band') do
    band = Band.create(name: 'Pink floyd')
    venue = Venue.create(description: 'Stadium')
    visit("/bands/#{band.id}")
    check(venue.description)
    click_button('Assign venues')
    expect(page).to have_content(venue.description)
  end
end
