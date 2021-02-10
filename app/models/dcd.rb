class Dcd < ApplicationRecord
  DCD_RELATIONSHIPS = ["Parent", "Sibling", "Aunt/Uncle", "Cousin", "Niece/Nephew", "Child", "Friend", "Spouse", "Significant Other", "Grandparent", "Other"]

  validate :relationship_valid?

  validates :first_name, presence: :true 
  validates :last_name, presence: :true


  has_many :users, through: :posts
  has_many :posts
  has_one_attached :picture

  private

    def relationship_valid?
      if self.relationship && !DCD_RELATIONSHIPS.include?(self.relationship)
        self.errors.add(:relationship, "Please pick a valid relationship")
    end
  end
end
