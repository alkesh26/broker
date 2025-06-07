class Subscriber < ApplicationRecord
  has_many :subscriptions
  has_many :topics, through: :subscriptions

  validates :name, presence: true, 
                  uniqueness: true,
                  length: { maximum: 100 }

  def receive(topic_name, message)
    Rails.logger.info "#{name} received message on #{topic_name}: #{message}"
  end
end
