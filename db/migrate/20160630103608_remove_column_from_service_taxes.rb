class RemoveColumnFromServiceTaxes < ActiveRecord::Migration
  def change
    remove_column :service_taxes, :service_provider_category, :string
  end
end
