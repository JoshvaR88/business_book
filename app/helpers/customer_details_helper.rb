module CustomerDetailsHelper

  def customer_goods?
    string = current_user.company_profile.sales_configuration.tax_organization
    str_to_arr = eval(string)
    remove_emp_str = str_to_arr.delete_if {|f| f == ""}
    remove_emp_str.include?("Sales of Goods")
  end
end
