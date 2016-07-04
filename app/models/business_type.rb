class BusinessType < ActiveRecord::Base

  def self.collect_business_type
    pluck(:name, :id)
  end

end
