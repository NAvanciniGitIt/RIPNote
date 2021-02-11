class Dcd < ApplicationRecord
  

  validates :first_name, presence: :true 
  validates :last_name, presence: :true
  validates :relationship, presence: true
  validates :birthday, presence: true
  validates :deathday, presence: true
  validates :gender, presence: true


  has_many :users, through: :posts
  has_many :posts, :dependent => :destroy
  has_one_attached :picture

end
