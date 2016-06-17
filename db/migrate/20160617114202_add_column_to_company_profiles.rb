class AddColumnToCompanyProfiles < ActiveRecord::Migration
  def change
    add_column :company_profiles, :accounting_mode, :integer
  end
end
