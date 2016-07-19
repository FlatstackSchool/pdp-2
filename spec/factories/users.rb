FactoryGirl.define do
  factory :user do
    email
    full_name { Faker::Name.name }
    password "123456"
    password_confirmation { password }
  end
end
