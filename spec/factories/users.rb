require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.first_name { Faker::Name.first_name }    
    f.last_name  { Faker::Name.last_name }
    f.email { "zdzich@siemacho.com" }
    f.password { "abc123A" }
    f.password_confirmation { "abc123A" }
  end
end
