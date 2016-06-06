user = FactoryGirl.create(:user, email: "user@example.com")

15.times do |i|
  article = Article.create(title: Faker::Lorem.sentence,
                            description: Faker::Lorem.paragraph,
                            user: user)
  article.comments.create(text: Faker::Lorem.sentence, user: user)
end
