class CreateCocktails < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :image
      t.text :description
      t.text :directions

      t.timestamps
    end
  end
end
