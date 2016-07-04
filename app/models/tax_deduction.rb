class TaxDeduction < ActiveRecord::Base
  belongs_to :company_profile
  # validates :tan_no, :cit_address, :deductor_collector, :responsibility_tax_person, :designation, presence: true
end
