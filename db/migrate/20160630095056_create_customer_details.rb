class CreateCustomerDetails < ActiveRecord::Migration
  def change
    create_table :customer_details do |t|
      t.integer :address
      t.boolean :residential_status_type
      t.string :customer_name
      t.string :attention_to
      t.text :billing_address
      t.string :email
      t.string :contact_number

      t.timestamps null: false
    end
  end
end
