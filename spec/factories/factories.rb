FactoryGirl.define do
  factory :user do
    name     "Test User"
    email    "tu@test.com"
    password "foobar"
    password_confirmation "foobar"
  end
end