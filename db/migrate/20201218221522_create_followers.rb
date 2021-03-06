class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :follower_id, null: false, foreign_key: true
      t.references :following_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
