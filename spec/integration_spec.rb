require('spec_helper')

describe('user funtionality through Band Tracker application', {:type => :feature}) do
  it('will route to Bands page') do
    visit('/')
    click_link('Bands')
    expect(page).to have_content("Bands")
  end

  it('will route to the venues page') do
    visit('/')
    click_link('Venue')
    expect(page).to have_content("Venue Form")
  end

  it('will post a band') do
    visit('/bands')
    fill_in("band_name", :with => "generic")
    click_button('Submit')
    expect(page).to have_content("Generic")
  end

  it('will post a venue') do
    visit('/venues')
    fill_in("venue_name", :with => "generic")
    click_button('Submit')
    expect(page).to have_content("Generic")
  end

  it('will route to an individual band page') do
    visit('/bands')
    fill_in("band_name", :with => "generic")
    click_button('Submit')
    click_link('Generic')
    expect(page).to have_content('Generic')
  end

  it('will delete a band') do
    visit('/bands')
    fill_in("band_name", :with => "generic")
    click_button('Submit')
    click_link('Generic')
    click_button('Delete Band')
    expect(page).to_not have_content("Generic")
  end

end
