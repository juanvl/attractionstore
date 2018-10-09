class CreateSaleTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_types do |t|
      t.string :title
      t.float :price
      t.references :attraction, foreign_key: true
      t.references :customer_type, foreign_key: true

      t.timestamps
    end
  end
end
