class AddColumnBooks < ActiveRecord::Migration[5.2]
  def change
  	add_column :books, :image_id, :integer
  end
end
