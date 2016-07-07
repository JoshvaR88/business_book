class RemoveColumnFromSalesTaxCentrals < ActiveRecord::Migration
  def change
    remove_column :sales_tax_centrals, :state, :integer
  end
end
