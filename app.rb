require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

get('/venues') do
  @venues = Venue.all()
  erb(:venues)
end

post('/bands') do
  name = params.fetch("band_name")
  Band.create({name: name})
  redirect("/bands")
end
