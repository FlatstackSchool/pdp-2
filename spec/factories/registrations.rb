FactoryGirl.define do
  factory :registration do
    subdomain { Faker::Internet.domain_word }
    email
    password "123456"
    password_confirmation { password }
  end
end
