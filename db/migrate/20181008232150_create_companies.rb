class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :national_registry_number
      t.string :social_name
      t.string :business_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
