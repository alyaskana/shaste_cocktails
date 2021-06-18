class RenameFollowerTableToFollow < ActiveRecord::Migration[6.0]
  def change
    rename_table :followers, :follows
  end
end
