class State < ActiveRecord::Base
  belongs_to :country

  def self.collect_state
    pluck(:name, :id)
  end

  def self.collect_state_code
    pluck(:name, :state_code)
  end

  def self.collect_state_sales
    pluck(:name, :state_code)
  end
end
