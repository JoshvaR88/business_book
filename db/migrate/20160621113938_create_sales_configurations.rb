class CreateSalesConfigurations < ActiveRecord::Migration
  def change
    create_table :sales_configurations do |t|
      t.string :tax_organization
      t.boolean :invoice_reg_office
      t.boolean :invoice_outside_branch_state

      t.timestamps null: false
    end
  end
end
