class CreateBusinessTypes < ActiveRecord::Migration
  def change
    create_table :business_types do |t|
      t.string :name, default: ''

      t.timestamps null: false
    end
  end
end
