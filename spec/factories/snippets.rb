FactoryGirl.define do
  factory :snippet do
    association :kind, factory: :kind
    sequence(:title) { |n| "#{Faker::Hacker.noun}-#{n}"}
    work { Faker::Hipster.paragraph}
    private false
    user nil
  end
end
