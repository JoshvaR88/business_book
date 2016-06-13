class CompanyProfile < ActiveRecord::Base
  has_many :office_addresses
  has_many :authorized_signatories
end
