module CompanyProfilesHelper
  def registered_office_address?
    if current_user.company_profile.blank?
      p "truuuuuuuuuueeeeeeeeeeee"
      return true;
    else
      p "faaaaaaalllllssseeeeeeee"
      return false;
    end
  end

end
