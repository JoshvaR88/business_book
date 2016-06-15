class AuthorizedSignatory < ActiveRecord::Base
  belongs_to :company_profile
  validates :person_name, :person_position, :person_id_no, presence: true
end
