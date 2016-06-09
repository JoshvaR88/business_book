class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :company_name
      t.string :company_type
      t.string :country
      t.string :business
      t.string :mobile_no

      t.timestamps null: false
    end
  end
end
