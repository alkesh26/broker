class Topic < ApplicationRecord
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions
  has_many :messages

  validates :name, presence: true,
                  uniqueness: true,
                  length: { maximum: 100 }
end
