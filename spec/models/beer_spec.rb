require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "is saved if has the username and style set correctly" do
    beer = Beer.create name:"Iso 8", style:"Lager"

    expect(Beer.count).to eq(1)
  end

  it "it is not saved if hasn't got name" do
    beer = Beer.create style:"Lager"

    expect(Beer.count).to eq(0)
    expect(beer).not_to be_valid
  end

  it "it is not saved if hasn't got style" do
    beer = Beer.create name:"Iso Kolmonen"

    expect(Beer.count).to eq(0)
    expect(beer).not_to be_valid
  end

end
