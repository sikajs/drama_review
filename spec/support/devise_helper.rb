def sign_in_as!(user=FactoryGirl.build(:user))
  visit new_user_session_path({locale: 'en'})
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Log In"
end
