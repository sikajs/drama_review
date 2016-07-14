class Drama < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  has_attached_file :image, styles: { medium: "500x700#", small: "300x500#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
