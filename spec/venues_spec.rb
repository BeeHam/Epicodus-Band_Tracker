require('spec_helper')

describe(Venue) do
  it {should have_and_belong_to_many(:bands)}
  it {should validate_presence_of(:name)}

  it("will capitalize the name before saving") do
    venue_name = Venue.create({:name => "generic"})
    expect(venue_name.name()).to(eq("Generic"))
  end
end
