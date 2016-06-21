class CreateSalesTaxAdditionalInfos < ActiveRecord::Migration
  def change
    create_table :sales_tax_additional_infos do |t|
      t.integer :reg_circle
      t.string :division
      t.string :area_code
      t.string :authorized_person_name
      t.string :designation
      t.references :sales_configuration, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
