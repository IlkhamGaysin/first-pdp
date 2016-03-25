FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end
