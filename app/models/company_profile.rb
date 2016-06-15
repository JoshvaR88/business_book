class CompanyProfile < ActiveRecord::Base
  has_many :office_addresses
  has_many :authorized_signatories
  validates :company_name, :email, :company_website, :company_type, :pan_no, :corp_id_no, presence: true

  accepts_nested_attributes_for :office_addresses
  accepts_nested_attributes_for :authorized_signatories

  COMPANY = ["private", "private"]
  POSITION = ["Managing Director", "Managing Director"]
  STATE = ["Tamil Nadu", "Tamil Nadu"]

end

