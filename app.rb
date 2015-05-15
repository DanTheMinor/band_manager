require("bundler/setup")
Bundler.require(:default)
require('sinatra/reloader')

also_reload('lib/**/*.rb')
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }



get '/' do
  erb :index
end

get '/venues' do
  @success_message = ''
  erb :venues
end

post '/venues' do
  description = params.fetch('description')
  venue = Venue.new(description: description)
  if venue.save()
    @success_message = 'New Venue Added!'
  else
    @success_message = 'Failed to add venue'
  end
  erb :venues
end

get '/bands' do
  @bands = Band.all()
  erb :bands
end

post '/bands' do
  name = params.fetch('name')
  Band.create(name: name)
  redirect '/bands'
end

get '/bands/:id' do
  @band = Band.find(params.fetch('id').to_i)
  @all_venues = Venue.all()
  erb :band
end

patch '/bands/:id' do
  new_name = params.fetch('band_new_name')
  @band = Band.find(params.fetch('id').to_i)
  @band.update(name: new_name)
  redirect '/bands'
end

delete '/bands/:id' do
  @band = Band.find(params.fetch('id').to_i)
  @band.delete()
  redirect '/bands'
end

patch '/bands/:id/assign_venue' do
  @band = Band.find(params.fetch('id').to_i)
  @all_venues = Venue.all()
  venue_ids = params.fetch("venue_ids", [])
  @band.venues.each do |venue|
    venue_ids.push(venue.id)
  end
  @band.update(venue_ids: venue_ids)
  erb :band
end
