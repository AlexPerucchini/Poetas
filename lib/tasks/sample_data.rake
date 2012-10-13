namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_poems
    #make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Alex Perucchini",
                       email:    "alexp@test.com",
                       password: "foobar",
                       password_confirmation: "foobar")
  #admin.toggle!(:admin)
  25.times do |n|
    name  = Faker::Name.name
    email = "user#{n+1}@test.com"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_poems
  users = User.all(limit: 6)
  10.times do
    title = Faker::Lorem.sentence(1)
    body = Faker::Lorem.paragraphs(5)
    users.each do |user| 
      user.poems.create!(title: title, body: body) 
    end
  end
end
=begin
def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
=end 