class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :author
  has_many :elements

  has_one_attached :header_image
end
