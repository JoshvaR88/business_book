class CreateSalesTaxIeCodes < ActiveRecord::Migration
  def change
    create_table :sales_tax_ie_codes do |t|
      t.string :ie_code
      t.references :sales_configuration, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
