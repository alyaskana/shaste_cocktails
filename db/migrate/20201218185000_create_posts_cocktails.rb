class CreatePostsCocktails < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_cocktails do |t|
      t.references :post, null: false, foreign_key: true
      t.references :cocktail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
