class CreateAuthorizedSignatories < ActiveRecord::Migration
  def change
    create_table :authorized_signatories do |t|
      t.string :person_name
      t.integer :person_position
      t.integer :person_id_no
      t.references :company_profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
