class CreateCustomerGoodsDetails < ActiveRecord::Migration
  def change
    create_table :customer_goods_details do |t|
      t.integer :state
      t.string :pin_code
      t.integer :customer_business_type
      t.string :customer_pan_no
      t.string :service_tax_no
      t.string :local_sales_tax_no
      t.string :central_sales_tax_no
      t.boolean :goods_address
      t.text :delivery_address
      t.string :email
      t.string :contact_no
      t.integer :state
      t.string :pin_code
      t.references :customer_detail, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
