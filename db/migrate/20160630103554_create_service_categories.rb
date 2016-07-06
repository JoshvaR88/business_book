class CreateServiceCategories < ActiveRecord::Migration
  def change
    create_table :service_categories do |t|
      t.string :name
      t.integer :service_tax_code
      t.integer :interest_tax_code
      t.integer :penalties_code

      t.timestamps null: false
    end
  end
end
