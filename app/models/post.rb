class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: 25..250

  acts_as_votable

  belongs_to :author
  has_many :elements, dependent: :destroy

  has_one_attached :header_image
  
  scope :published, -> do
    where(published: true)
  end

  scope :most_recently_published, -> do
    order(published_at: :desc)
  end
end
