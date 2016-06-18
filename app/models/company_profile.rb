class CompanyProfile < ActiveRecord::Base
  include DropdownList

  has_many :office_addresses
  has_many :authorized_signatories
  has_many :tax_deductions

  # validates :company_name, :email, :company_website, :company_type, :pan_no, :corp_id_no, :accounting_mode, presence: true

  accepts_nested_attributes_for :office_addresses, :authorized_signatories, :tax_deductions

  COMPANY = LIST_OF_COMPANY

  POSITION = POSITION_LIST


end

