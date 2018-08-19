class CreateItemsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :name
      t.text :description
      t.integer :unit_price
      t.text :image
      t.integer :merchant_id

      t.timestamps null: false
    end
  end
end
