class CreateTaxDeductions < ActiveRecord::Migration
  def change
    create_table :tax_deductions do |t|
      t.string :tan_no
      t.string :cit_address
      t.integer :deductor_collector
      t.string :responsibility_tax_person
      t.string :designation
      t.references :company_profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
