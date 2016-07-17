class Drama < ActiveRecord::Base

  scope :recent_first, -> { order("created_at DESC") }

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :image, styles: { medium: "500x700#", small: "300x500#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :title, presence: true
  validates :title, length: { maximum: 40 }
  validates :description, presence: true

  after_touch :reindex
  searchkick merge_mappings: true, mappings: {
    drama: {
      properties: {
        title: { type: "string", analyzer: "keyword" }
      }
    }
  }

  def search_data
    {
      title: title,
      actors: actors
    }
  end

end
