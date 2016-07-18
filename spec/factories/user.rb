FactoryGirl.define do
  factory :user do |f|
    f.name "test user"
    f.email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    #confirmed_at Date.today
  end
end
