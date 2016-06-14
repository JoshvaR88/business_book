class State < ActiveRecord::Base
  belongs_to :country

  def self.collect_state
    pluck(:name)
  end
end
