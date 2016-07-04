class AddColumnToCustomerGoodsDetails < ActiveRecord::Migration
  def change
    add_column :customer_goods_details, :delivery_state, :integer
    add_column :customer_goods_details, :state_code, :string
  end
end
