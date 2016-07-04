class CreateSalesTaxes < ActiveRecord::Migration
  def change
    create_table :sales_taxes do |t|
      t.integer :vat_type
      t.string :tax_reg_no
      t.datetime :tax_date
      t.references :sales_configuration, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
