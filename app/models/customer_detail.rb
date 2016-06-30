class CustomerDetail < ActiveRecord::Base
  include DropdownList

  has_one :customer_goods_detail
  accepts_nested_attributes_for :customer_goods_detail

end
