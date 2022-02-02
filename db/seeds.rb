user = User.create(
        email: 'test2@test.com',
        password: '123123',
        password_confirmation: '123123',
        first_name: 'Jon',
        last_name: 'Snow'
      )
100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: user.id)
end

puts '100 posts havwe been created'
