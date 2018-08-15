class CreateMerchantTable < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants, id: false do |t|
      t.integer :id
      t.text :name
      t.date :created_at
      t.date :updated_at
    end
  end
end
