class CreateOfficeAddresses < ActiveRecord::Migration
  def change
    create_table :office_addresses do |t|
      t.string :branch
      t.text :address
      t.integer :state
      t.string :telephone_no
      t.boolean :is_registered
      t.references :company_profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
