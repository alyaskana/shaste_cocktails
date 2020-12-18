class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :parent, null: false, foreign_key: true
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end
