FactoryBot.define do
  factory :subscriber do
    sequence(:name) { |n| "Subscriber #{n}" }
  end
end
