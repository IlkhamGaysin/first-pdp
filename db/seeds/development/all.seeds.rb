user = FactoryGirl.create(:user, email: "user@example.com")

5.times do |i|
  Article.create(title: Faker::Lorem.sentence,
                  description: Faker::Lorem.paragraph,
                  user: user)
end
