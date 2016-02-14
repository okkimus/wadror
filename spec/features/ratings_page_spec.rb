require 'rails_helper'

include Helpers

describe "Ratings page" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryGirl.create :beer, name:"karhu", brewery:brewery }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    rating = FactoryGirl.create(:rating, beer_id:1)
    rating2 = FactoryGirl.create(:rating, score:20, beer_id:2)
    user.ratings << rating
    user.ratings << rating2
  end


  it "does have saved ratings" do
    visit ratings_path

    expect(page).to have_content 'Number of ratings: 2'
    expect(page).to have_content 'iso 3'
    expect(page).to have_content 'karhu'
  end
end