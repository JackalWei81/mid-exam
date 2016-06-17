class AddUserToDisaster < ActiveRecord::Migration
  def change
    add_column :disasters, :user_id, :string
  end
end
