
puts "seeds runninng..."


# マイクロポスト
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
  print "."
end
puts "\n-> Micropost_seeds OK!!"

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed); print "." }
puts "\n-> Following_seeds OK!!"
followers.each { |follower| follower.follow(user); print "." }
puts "\n-> Follower_seeds OK!!"

puts "\n=> All_seeds OK!!"
>>>>>>>>> local version
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
