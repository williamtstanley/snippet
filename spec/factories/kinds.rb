FactoryGirl.define do
  factory :kind do
    sequence(:title) { |n| "#{Faker::Hacker.noun}-#{n}" }
  end
end
