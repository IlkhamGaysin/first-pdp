class AddAvatarIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_id, :string
    remove_column :users, :avatar
  end
end
