require 'rails_helper'

include Helpers

describe "User's page" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryGirl.create :beer, name:"karhu", brewery:brewery }
  let!(:user) { FactoryGirl.create :user }
  let!(:user2) { FactoryGirl.create :user, username:"Jaajo" }

  before :each do
    rating = FactoryGirl.create(:rating, beer_id:1)
    rating2 = FactoryGirl.create(:rating, score:20, beer_id:1)
    rating3 = FactoryGirl.create(:rating, score:30, beer_id:2)
    user.ratings << rating
    user.ratings << rating2
    user2.ratings << rating3
  end

  it "has user's ratings" do
    visit user_path(user)

    expect(page).to have_content 'has made 2 ratings'
    expect(page).to have_content 'iso 3 10'
    expect(page).not_to have_content 'karhu'
  end

  it "has ability to delete rating from db" do
    sign_in(username:"Pekka", password:"Foobar1")

    visit user_path(user)


    expect{
      page.all('a')[7].click
    }.to change{Rating.count}.by(-1)


  end

end