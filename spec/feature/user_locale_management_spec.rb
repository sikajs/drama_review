require 'rails_helper'

RSpec.feature "User's locale management", :type => :feature do
  let(:user) { FactoryGirl.create(:user, :name => "test user") }

  before :each do
    sign_in_as!(user)
  end

  scenario "User change the locale in their own profile page" do
    visit user_profile_path(user)

    expect(page).to have_content("Profile")

    click_link("Language")
    click_link("Traditional Chinese")

    expect(page).to have_content("個人情報")
  end
end
