class CompanyProfile < ActiveRecord::Base
  include DropdownList

  has_many :office_addresses
  has_many :authorized_signatories
  validates :company_name, :email, :company_website, :company_type, :pan_no, :corp_id_no, presence: true

  accepts_nested_attributes_for :office_addresses
  accepts_nested_attributes_for :authorized_signatories

  COMPANY = LIST_OF_COMPANY.zip(LIST_OF_COMPANY)

  POSITION = POSITION_LIST.zip(POSITION_LIST)

end

