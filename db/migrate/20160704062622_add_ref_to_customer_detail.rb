class AddRefToCustomerDetail < ActiveRecord::Migration
  def change
    add_reference :customer_details, :company_profile, index: true, foreign_key: true
  end
end
