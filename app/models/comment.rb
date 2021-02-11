class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_length_of :content, minimum: 1, maximum: 100, allow_blank: false
end
