require "spec_helper"

describe(Venue) do
  it("Will not create a venue if there is no name set") do
    test_venue = Venue.create(description: "")
    expect(Venue.all()).to(eq([]))
  end

  it("Will capitalize the name of a vanue upon creation") do
    test_venue = Venue.create(description: "stadium")
    expect(test_venue.description()).to(eq("Stadium"))
  end
end
