FactoryGirl.define do
  factory :sign_up do
    subdomain { Faker::Internet.domain_word }
    email
    password "123456"
    password_confirmation { password }
  end
end
