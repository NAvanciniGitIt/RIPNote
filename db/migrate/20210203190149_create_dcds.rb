class CreateDcds < ActiveRecord::Migration[6.1]
  def change
    create_table :dcds do |t|
      t.string :first_name
      t.string :last_name
      t.string :relationship
      t.string :gender
      t.date :birthday
      t.date :deathday
      
      t.timestamps
    end
  end
end
