FactoryGirl.define do
  factory :registration do
    subdomain
    email
    password "123456"
    password_confirmation { password }
  end
end
