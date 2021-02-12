class Dcd < ApplicationRecord
  

  validates :first_name, presence: :true 
  validates :last_name, presence: :true
  validates :relationship, presence: true
  validates :birthday, presence: true
  validates :deathday, presence: true
  validates :gender, presence: true


  belongs_to :user
  has_many :posts, dependent: :delete_all
  has_one_attached :picture


  # @search = params["search"]
  #   if @search.present?
  #     @first_name = @search["first_name"]
  #     @dcds = Dcd.where("first_name LIKE ?", "%#{@first_name}%")
  #   end

  # def self.search_dcd(name)
  #   where("first_name, last_name LIKE ?", "%#{name}%")
  # end 


  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.search(params)
    where("LOWER(first_name) || ' ' || LOWER(last_name) LIKE :s", :s => "%#{params.downcase}%")
  end #downcase attributes ,, checking both i guess, stage parameter assigning to key of S our params downcased -- looking for similarities. 
end
