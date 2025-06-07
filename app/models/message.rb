class Message < ApplicationRecord
  belongs_to :topic

  validates :publisher_name, presence: true,
                           length: { maximum: 100 }
  validates :content, presence: true
end
