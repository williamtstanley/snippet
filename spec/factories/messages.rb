FactoryGirl.define do
  factory :message do
    user nil
    conversation nil
    body "MyText"
  end
end
