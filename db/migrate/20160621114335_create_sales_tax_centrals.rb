class CreateSalesTaxCentrals < ActiveRecord::Migration
  def change
    create_table :sales_tax_centrals do |t|
      t.integer :state
      t.boolean :central_sales_tax
      t.string :central_reg_no
      t.datetime :central_tax_date
      t.references :sales_configuration, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
