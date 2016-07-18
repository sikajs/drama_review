FactoryGirl.define do
  factory :drama do |f|
    f.title "test drama"
    f.description "test drama description"
    f.num_of_chapter 20
    f.actors Faker::Name.name
  end

  factory :invalid_drama, parent: :drama do |f|
    f.title nil
  end
end
