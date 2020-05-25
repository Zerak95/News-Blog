class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :content, presence: true, length: { maximum: 1000 }
end
