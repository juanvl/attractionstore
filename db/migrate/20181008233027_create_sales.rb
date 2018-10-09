class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.timestamp :sale_date
      t.references :sale_type, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
