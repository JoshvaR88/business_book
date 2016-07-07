class AddRefToCompanyProfile < ActiveRecord::Migration
  def change
    add_reference :company_profiles, :user, index: true, foreign_key: true
  end
end
