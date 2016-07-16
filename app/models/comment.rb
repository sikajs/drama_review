class Comment < ActiveRecord::Base

  scope :recent_first, -> { order("created_at DESC") }

  belongs_to :drama
  belongs_to :user

  validates :content, presence: true
end
