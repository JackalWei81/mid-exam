class ChangeColumnToDisasters < ActiveRecord::Migration
  def change
    change_column :disasters, :user_id, :integer
  end
end
