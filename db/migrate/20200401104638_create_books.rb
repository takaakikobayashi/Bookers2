class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :image_id
      t.text :title
      t.text :option
      t.integer :user_id

      t.timestamps
    end
  end
end
