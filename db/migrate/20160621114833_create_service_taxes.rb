class CreateServiceTaxes < ActiveRecord::Migration
  def change
    create_table :service_taxes do |t|
      t.string :service_type
      t.string :service_provider_category
      t.string :service_tax_reg_no
      t.boolean :large_tax_payer
      t.references :sales_configuration, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
