class CreateDcds < ActiveRecord::Migration[6.1]
  def change
    create_table :dcds do |t|
      t.string :first_name
      t.string :last_name
      t.string :relationship
      t.string :gender
      t.date :birthday
      t.date :deathday
      t.text :bio
      t.integer :user_id
      
      t.timestamps
    end
  end
end
