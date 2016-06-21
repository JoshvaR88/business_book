class CreateServiceTaxAdditionalInfos < ActiveRecord::Migration
  def change
    create_table :service_tax_additional_infos do |t|
      t.string :commissionerate_name
      t.string :commissionerate_code
      t.text :address
      t.string :jurisdiction
      t.string :division_name
      t.string :division_code
      t.string :range_name
      t.string :range_code
      t.text :range_address
      t.string :range_jurisdiction
      t.references :sales_configuration, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
