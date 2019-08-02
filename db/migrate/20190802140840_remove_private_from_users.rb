class RemovePrivateFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :private
  end
end
