class AddRefToSalesConfiguration < ActiveRecord::Migration
  def change
    add_reference :sales_configurations, :company_profile, index: true, foreign_key: true
  end
end
