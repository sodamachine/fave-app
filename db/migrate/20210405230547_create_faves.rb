class CreateFaves < ActiveRecord::Migration[6.1]
  def change
    create_table :faves do |t|
      t.string :name
      t.string :brand
      t.integer :user_id
    end
  end
end
