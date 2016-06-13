class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|
      t.string :company_name
      t.string :email
      t.string :company_website
      t.string :company_type
      t.string :pan_no
      t.string :corp_id_no

      t.timestamps null: false
    end
  end
end
