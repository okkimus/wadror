require 'rails_helper'

include Helpers

describe "Beers page" do
  before :each do
    FactoryGirl.create(:brewery)
  end

  it "should show error message if beer name is invalid" do
    visit new_beer_path

    fill_in('beer[name]', with:'')
    select('Lager', from:'beer[style]')
    select('anonymous', from:'beer[brewery_id]')
    click_button('Create Beer')

    expect{
      click_button('Create Beer')
    }.to change{Beer.count}.by(0)

    expect(page).to have_content "Name can't be blank"

  end

  it "should save a beer from site" do
    visit new_beer_path

    fill_in('beer[name]', with:'Kalja')
    select('Lager', from:'beer[style]')
    select('anonymous', from:'beer[brewery_id]')

    expect{
      click_button('Create Beer')
    }.to change{Beer.count}.by(1)

    expect(page).to have_content 'Kalja'
  end
end
