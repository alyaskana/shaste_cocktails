class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :login
      t.string :user_name
      t.string :last_name
      t.string :avatar

      t.timestamps
    end
  end
end
