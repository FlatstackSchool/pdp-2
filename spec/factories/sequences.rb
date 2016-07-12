FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:title) { |n| "#{Faker::Lorem.words} #{n}" }
  sequence(:subdomain) { Faker::Internet.domain_word }
end
