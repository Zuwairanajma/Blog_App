class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo_link
      t.string :bio
      t.integer :posts_counter

      t.timestamps
    end
  end
end
