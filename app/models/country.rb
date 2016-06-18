class Country < ActiveRecord::Base
  has_many :states
  def self.collect_country
    pluck(:name, :id)
  end
end
