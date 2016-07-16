class Comment < ActiveRecord::Base
  belongs_to :drama
  belongs_to :user

  validates :content, presence: true
end
