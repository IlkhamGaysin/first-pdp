FactoryGirl.define do
  factory :comment do
    text { Faker::Lorem.paragraph }
    article
  end
end
