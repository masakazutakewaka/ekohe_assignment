user = User.create(email: 'ekohe@com', password: 'assignment')

25.times do |n|
  user.articles.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph, publish_flag: :draft, published_at: nil)
end
