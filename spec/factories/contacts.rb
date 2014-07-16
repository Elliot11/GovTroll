# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    sequence(:email) { |n| "email_#{n}@parliament.gov.au" }
    sequence(:first_name) { |n| "first_name #{n}" }
    sequence(:last_name) { |n| "last_name #{n}" }
    sequence(:twitter) { |n| "@twitter#{n}" }
    sequence(:facebook) { |n| "http://www.facebook.com/example.#{n}" }
  end
end
