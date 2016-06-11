class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, default: ""
      t.string :phone_country_code, default: ""
      t.string :currency, default: ""

      t.timestamps null: false
    end
  end
end
