class Post < ApplicationRecord
  #accepts_nested_attributes_for :dcds, :users

  belongs_to :user
  belongs_to :dcd
  has_many :comments
  has_one_attached :picture
end
