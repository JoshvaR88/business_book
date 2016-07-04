# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160704062622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorized_signatories", force: :cascade do |t|
    t.string   "person_name"
    t.integer  "person_position"
    t.integer  "person_id_no"
    t.integer  "company_profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "authorized_signatories", ["company_profile_id"], name: "index_authorized_signatories_on_company_profile_id", using: :btree

  create_table "business_types", force: :cascade do |t|
    t.string   "name",       default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "company_profiles", force: :cascade do |t|
    t.string   "company_name"
    t.string   "email"
    t.string   "company_website"
    t.string   "company_type"
    t.string   "pan_no"
    t.string   "corp_id_no"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "accounting_mode"
    t.integer  "user_id"
  end

  add_index "company_profiles", ["user_id"], name: "index_company_profiles_on_user_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",               default: ""
    t.string   "phone_country_code", default: ""
    t.string   "currency",           default: ""
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "customer_details", force: :cascade do |t|
    t.integer  "address"
    t.boolean  "residential_status_type"
    t.string   "customer_name"
    t.string   "attention_to"
    t.text     "billing_address"
    t.string   "email"
    t.string   "contact_number"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "company_profile_id"
  end

  add_index "customer_details", ["company_profile_id"], name: "index_customer_details_on_company_profile_id", using: :btree

  create_table "customer_goods_details", force: :cascade do |t|
    t.integer  "state"
    t.string   "pin_code"
    t.integer  "customer_business_type"
    t.string   "customer_pan_no"
    t.string   "service_tax_no"
    t.string   "local_sales_tax_no"
    t.string   "central_sales_tax_no"
    t.boolean  "goods_address"
    t.text     "delivery_address"
    t.string   "email"
    t.string   "contact_no"
    t.integer  "customer_detail_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "delivery_state"
    t.string   "state_code"
  end

  add_index "customer_goods_details", ["customer_detail_id"], name: "index_customer_goods_details_on_customer_detail_id", using: :btree

  create_table "office_addresses", force: :cascade do |t|
    t.text     "branch_address"
    t.integer  "state"
    t.string   "telephone_no"
    t.boolean  "is_registered"
    t.integer  "company_profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "office_addresses", ["company_profile_id"], name: "index_office_addresses_on_company_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "company_name"
    t.integer  "country"
    t.integer  "state"
    t.integer  "business"
    t.string   "mobile_no"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "sales_configurations", force: :cascade do |t|
    t.string   "tax_organization"
    t.boolean  "invoice_reg_office"
    t.boolean  "invoice_outside_branch_state"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "sales_tax_additional_infos", force: :cascade do |t|
    t.integer  "reg_circle"
    t.string   "division"
    t.string   "area_code"
    t.string   "authorized_person_name"
    t.string   "designation"
    t.string   "ie_code"
    t.integer  "sales_configuration_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sales_tax_additional_infos", ["sales_configuration_id"], name: "index_sales_tax_additional_infos_on_sales_configuration_id", using: :btree

  create_table "sales_tax_centrals", force: :cascade do |t|
    t.integer  "state"
    t.boolean  "central_sales_tax"
    t.string   "central_reg_no"
    t.datetime "central_tax_date"
    t.integer  "sales_configuration_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sales_tax_centrals", ["sales_configuration_id"], name: "index_sales_tax_centrals_on_sales_configuration_id", using: :btree

  create_table "sales_tax_ie_codes", force: :cascade do |t|
    t.string   "ie_code"
    t.integer  "sales_configuration_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sales_tax_ie_codes", ["sales_configuration_id"], name: "index_sales_tax_ie_codes_on_sales_configuration_id", using: :btree

  create_table "sales_taxes", force: :cascade do |t|
    t.integer  "vat_type"
    t.string   "tax_reg_no"
    t.datetime "tax_date"
    t.integer  "sales_configuration_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sales_taxes", ["sales_configuration_id"], name: "index_sales_taxes_on_sales_configuration_id", using: :btree

  create_table "service_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_tax_additional_infos", force: :cascade do |t|
    t.string   "commissionerate_name"
    t.string   "commissionerate_code"
    t.text     "address"
    t.string   "jurisdiction"
    t.string   "division_name"
    t.string   "division_code"
    t.string   "range_name"
    t.string   "range_code"
    t.text     "range_address"
    t.string   "range_jurisdiction"
    t.integer  "sales_configuration_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "service_tax_additional_infos", ["sales_configuration_id"], name: "index_service_tax_additional_infos_on_sales_configuration_id", using: :btree

  create_table "service_taxes", force: :cascade do |t|
    t.string   "service_type"
    t.string   "service_tax_reg_no"
    t.boolean  "large_tax_payer"
    t.integer  "sales_configuration_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "service_taxes", ["sales_configuration_id"], name: "index_service_taxes_on_sales_configuration_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name",       default: ""
    t.integer  "country_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree

  create_table "tax_deductions", force: :cascade do |t|
    t.string   "tan_no"
    t.string   "cit_address"
    t.integer  "deductor_collector"
    t.string   "responsibility_tax_person"
    t.string   "designation"
    t.integer  "company_profile_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "tax_deductions", ["company_profile_id"], name: "index_tax_deductions_on_company_profile_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "authorized_signatories", "company_profiles"
  add_foreign_key "company_profiles", "users"
  add_foreign_key "customer_details", "company_profiles"
  add_foreign_key "customer_goods_details", "customer_details"
  add_foreign_key "office_addresses", "company_profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "sales_tax_additional_infos", "sales_configurations"
  add_foreign_key "sales_tax_centrals", "sales_configurations"
  add_foreign_key "sales_tax_ie_codes", "sales_configurations"
  add_foreign_key "sales_taxes", "sales_configurations"
  add_foreign_key "service_tax_additional_infos", "sales_configurations"
  add_foreign_key "service_taxes", "sales_configurations"
  add_foreign_key "states", "countries"
  add_foreign_key "tax_deductions", "company_profiles"
end
