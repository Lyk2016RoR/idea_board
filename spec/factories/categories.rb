FactoryGirl.define do
  factory :category do
    title { Faker::Book.title }
    desc { Faker::Hipster.paragraph }
    color "red"
  end
end
