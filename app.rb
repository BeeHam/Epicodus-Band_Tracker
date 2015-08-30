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

post('/venues') do
  name = params.fetch("venue_name")
  Venue.create({name: name})
  redirect("/venues")
end

get('/band/:id') do
  @venue = Venue.all()
  @band = Band.find(params.fetch("id").to_i())
  erb(:band)
end

get('/venue/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  erb(:venue)
end

# post('/band/:id') do
#   @venue = Venue.all()
#   @band = Band.find(params.fetch("id").to_i())
#   venue = params.fetch('venue')
#   @band.venues.create({:name => venue})
#   redirect("/band/#{@band.id()}")
# end

patch('/band/:id') do
  @band = Band.find(params.fetch("id").to_i())
  venue = Venue.find(params.fetch('venue').to_i())
  @band.venues.push(venue)
  redirect("/band/#{@band.id()}")
end

post('/venue/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  band = params.fetch('band')
  @venue.bands.create({:name => band})
  redirect("/venue/#{@venue.id()}")
end

patch('/band/:id') do
  @band = Band.find(params.fetch("id").to_i())
  band = params.fetch('band')
  @band.update({:name => band})
  redirect back
end

patch('/venue/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  venue = params.fetch('venue')
  @venue.update({:name => venue})
  redirect back
end

delete('/bands') do
  band = Band.find(params.fetch('band_id').to_i())
  band.destroy()
  @bands = Band.all()
  redirect('/bands')
end
