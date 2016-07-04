class SalesConfiguration < ActiveRecord::Base
  include DropdownList
  has_one :sales_tax
  has_one :sales_tax_additional_info
  has_one :sales_tax_central
  has_one :service_tax
  has_one :service_tax_additional_info

  accepts_nested_attributes_for :sales_tax, :sales_tax_additional_info, :sales_tax_central, :service_tax, :service_tax_additional_info,  allow_destroy: true, reject_if: :all_blank



end
