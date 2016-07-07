module CustomerDetailsHelper
<<<<<<< HEAD
=======
  def get_office_address
    if current_user.company_profile.sales_configuration.invoice_reg_office == "true"
      @a = curent_user.company_profile.office_addresses.pluck(:branch_address, :state, :telephone_no).first.gsub("\r", "")
    else
      @a = current_user.company_profile.office_addresses.pluck(:branch_address, :state, :telephone_no).last
    end
    return @a.join();
  end
>>>>>>> 75296708ee47e4315e63c22d71abee745bfa66f3

  def customer_goods?
    string = current_user.company_profile.sales_configuration.tax_organization
    str_to_arr = eval(string)
    remove_emp_str = str_to_arr.delete_if {|f| f == ""}
    remove_emp_str.include?("Sales of Goods")
  end
end
