FactoryGirl.define do
  factory :idea do
    title { Faker::Book.title }
    description { Faker::Hipster.paragraph(2) }
    category
  end
end
