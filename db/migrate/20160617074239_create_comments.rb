class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.string :name
      t.integer :disaster_id

      t.timestamps null: false

    end
    add_index :comments, :disaster_id
  end
end
