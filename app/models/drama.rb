class Drama < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :image, styles: { medium: "500x700#", small: "300x500#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :title, presence: true
  validates :title, length: { maximum: 40 }
  validates :description, presence: true

  searchkick
end
