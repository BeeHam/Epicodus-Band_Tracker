require('spec_helper')

describe('user funtionality through Band Tracker application', {:type => :feature}) do
  it('will route to Bands page') do
    visit('/')
    click_link('Bands')
    expect(page).to have_content("Bands")
  end

  it('will route to the venues page') do
    visit('/')
    click_link('Venues')
    expect(page).to have_content("Venues")
  end

  it('will post a band') do
    visit('/bands')
    fill_in("band_name", :with => "generic")
    click_button('Submit')
    expect(page).to have_content("Generic")
  end
end
