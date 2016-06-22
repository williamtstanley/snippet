FactoryGirl.define do
  factory :snippet do
    title { Faker::Hacker.noun}
    work { Faker::Hipster.paragraph}
    private false
    user nil
    kind nil
  end
end
