class ChangeDirectionsColumnTypeInCocktails < ActiveRecord::Migration[6.0]
  def change
    remove_column :cocktails, :directions, :string
    add_column :cocktails, :directions, :string, array: true, default: []
  end
end
