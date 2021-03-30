class RenameTastesToTags < ActiveRecord::Migration[6.0]
  def change
    rename_table :tastes, :tags
  end
end
