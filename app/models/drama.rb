class Drama < ActiveRecord::Base
  #TODO: image upload
  has_attached_file :image, styles: { medium: "600x800#", small: "300x500#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
