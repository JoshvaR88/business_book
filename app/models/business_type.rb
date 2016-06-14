class BusinessType < ActiveRecord::Base

  def self.collect_business_type
    pluck(:name)
  end

end
