class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :follower, null: false
      t.references :following, null: false

      t.timestamps
    end
    add_foreign_key :followers, :users, column: :follower_id, primary_key: :id
    add_foreign_key :followers, :users, column: :following_id, primary_key: :id
  end
end
