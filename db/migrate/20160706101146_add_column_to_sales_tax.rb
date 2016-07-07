class AddColumnToSalesTax < ActiveRecord::Migration
  def change
    add_column :sales_taxes, :state, :integer
  end
end
