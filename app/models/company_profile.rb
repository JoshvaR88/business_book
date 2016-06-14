class CompanyProfile < ActiveRecord::Base
  has_many :office_addresses
  has_many :authorized_signatories

  accepts_nested_attributes_for :office_addresses
  accepts_nested_attributes_for :authorized_signatories

  COMPANY = ["private", "private"]
  POSITION = ["Managing Director", "Managing Director"]
  STATE = ["Tamil Nadu", "Tamil Nadu"]

end

