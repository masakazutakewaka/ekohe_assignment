user = User.create(email: 'ekohe@com', password: 'ekohe')

Article.__elasticsearch__.create_index!
30.times do |n|
  user.articles.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph(10), publish_flag: :draft, published_at: Time.zone.now)
end
