namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    puts "Resetting existing data..."
    Rake::Task['db:reset'].invoke
    make_users
    make_poems
    puts "Preparing the test databse..."
    Rake::Task['db:test:prepare'].invoke
  end
end

def make_users
  admin = User.create!(name:     "Joe Admin",
                       email:    "admin@test.com",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.add_role :admin
  puts "Admin Account and Admin role created"
  25.times do |n|
    name  = Faker::Name.name
    email = "user#{n+1}@test.com"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
    puts "user created #{name}"
  end
end

def make_poems
  users = User.all(limit: 6)
  50.times do
    title = Faker::Lorem.sentence(1)
    body = Faker::Lorem.paragraphs(5)
    users.each do |user|
      user.poems.create!(title: title, body: body)
    end
  end
end
