require("bundler/setup")
Bundler.require(:default)
require('sinatra/reloader')

also_reload('lib/**/*.rb')
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
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
  erb :band
end
