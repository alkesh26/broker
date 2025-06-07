class Subscription < ApplicationRecord
  belongs_to :subscriber
  belongs_to :topic

  validates :subscriber_id, uniqueness: { scope: :topic_id }
end
