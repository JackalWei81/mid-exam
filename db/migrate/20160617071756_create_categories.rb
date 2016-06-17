class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

      t.string :name

      t.timestamps null: false
    end

    add_column :disasters, :category_id, :integer
    add_index :disasters, :category_id
  end
end
