class ServiceCategory < ActiveRecord::Base
  def self.collect_service_category
    pluck(:name, :id )
  end
end
