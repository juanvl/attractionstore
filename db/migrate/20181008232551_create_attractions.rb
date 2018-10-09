class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.text :address
      t.integer :duration_minutes
      t.integer :max_capacity
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
