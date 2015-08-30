require('spec_helper')

describe(Band) do
  it {should have_and_belong_to_many(:venues)}
  it {should validate_presence_of(:name)}

  it("will capitalize the name before saving") do
    band_name = Band.create({:name => "generic"})
    expect(band_name.name()).to(eq("Generic"))
  end
end
