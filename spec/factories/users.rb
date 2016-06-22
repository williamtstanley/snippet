FactoryGirl.define do
  factory :user do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    sequence(:email) {|n| Faker::Internet.email.gsub("@", "-#{n}@")}
    password {Faker::Internet.password}
  end
end
