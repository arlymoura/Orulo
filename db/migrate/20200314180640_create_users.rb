class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      # t.string :email
      t.string :name
      t.jsonb :favorite_buildings, :default => { "ids": [] }
      t.timestamps
    end
  end
end
