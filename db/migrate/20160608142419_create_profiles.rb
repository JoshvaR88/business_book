class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :company_name
      t.integer :country
      t.integer :state
      t.integer :business
      t.string :mobile_no

      t.timestamps null: false
    end
  end
end
