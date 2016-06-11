class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name, default: ""

      t.timestamps null: false
    end
  end
end
