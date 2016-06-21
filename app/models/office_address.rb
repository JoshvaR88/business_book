class OfficeAddress < ActiveRecord::Base
  belongs_to :company_profile
  # validates :branch_address, :state, :telephone_no, presence: true
end
