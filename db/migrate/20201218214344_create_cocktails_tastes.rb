class CreateCocktailsTastes < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails_tastes do |t|
      t.references :cocktail, null: false, foreign_key: true
      t.references :taste, null: false, foreign_key: true

      t.timestamps
    end
  end
end
