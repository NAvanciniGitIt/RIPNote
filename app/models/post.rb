class Post < ApplicationRecord
  

  belongs_to :user
  belongs_to :dcd
  has_many :comments
  has_one_attached :picture

  validates_length_of :post_content, minimum: 1, maximum: 100, allow_blank: false
  validates :title, presence: true 

  accepts_nested_attributes_for :comments
end
