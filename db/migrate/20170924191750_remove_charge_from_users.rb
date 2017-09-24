class RemoveChargeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :charge_id, :integer
  end
end
