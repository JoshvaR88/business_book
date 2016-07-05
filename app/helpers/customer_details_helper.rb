module CustomerDetailsHelper
  def register_office_address?
    if current_user.company_profile.sales_configuration.invoice_reg_office == "true"
      @a = curent_user.company_profile.office_addresses.branch_address.first.inspect
    else
      @a = current_user.company_profile.office_addresses.last.inspect
    end
    return @a;
  end
  def customer_goods?
    string = current_user.company_profile.sales_configuration.tax_organization
    str_to_arr = eval(string)
    remove_emp_str = str_to_arr.delete_if {|f| f == ""}
    remove_emp_str.include?("Sales of Goods")
  end
end
