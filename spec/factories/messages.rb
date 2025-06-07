FactoryBot.define do
  factory :message do
    association :topic
    sequence(:publisher_name) { |n| "Publisher #{n}" }
    sequence(:content) { |n| "Message content #{n}" }
  end
end 