FactoryGirl.define do
  factory :user do
    name "Joe Shmoe"
    email "js@test.com" 
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :poem do
    title "A poem"
    body "Lorem ipsum"
    user
  end
end