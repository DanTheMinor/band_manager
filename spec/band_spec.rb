require "spec_helper"

describe(Band) do
  it("Will not create a band if there is no name set") do
    test_band = Band.create(name: "")
    expect(Band.all()).to(eq([]))
  end

  it("Will capitalize the name of a band upon creation") do
    test_band = Band.create(name: "slayer")
    expect(test_band.name()).to(eq("Slayer"))
  end

end
