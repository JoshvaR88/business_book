class BusinessType < ActiveRecord::Base

  def self.collect_businees_type
    pluck(:name)
  end

end
