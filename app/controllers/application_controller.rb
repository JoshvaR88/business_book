class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def conditional_dropdown_list(selected)
    case selected
      when "Private"
        dropdown_values = ["Managing Director","Whole Time Director","Director"]
        dropdown_list =  dropdown_values.zip(dropdown_values)
        placeholder_value = "DIN"
      when "LLP"
        dropdown_values = ["Partner","Executive Partner"]
        dropdown_list =  dropdown_values.zip(dropdown_values)
        placeholder_value = "DPIN"
      when "OPC"
        dropdown_values = ["Managing Director","Whole Time Director","Director"]
        dropdown_list =  dropdown_values.zip(dropdown_values)
        placeholder_value = "DIN"
      when "Partnership Firm"
        dropdown_values = ["Partner"]
        dropdown_list =  dropdown_values.zip(dropdown_values)
        placeholder_value = "Partnership Member Number"
      when "Sole proprietorship"
        dropdown_values = ["Sole proprietorship"]
        dropdown_list =  dropdown_values.zip(dropdown_values)
        placeholder_value = "DPIN"
      else
    end
    company_profile = CompanyProfile.new
    2.times do
      company_profile.authorized_signatories.build
    end
    render json: {html: render_to_string("/company_profiles/_append_conditional_dropdown_list", layout: false, locals: {company_profile: company_profile, dropdown_list: dropdown_list, placeholder_value: placeholder_value})} and return
    # render json: 'company_profiles/append_conditional_dropdown_list', locals: {f: f, dropdown_list: CompanyProfile::POSITION, placeholder_value: "okokok"}

  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :email, :password, :first_name, :last_name, :user_id, :password_confirmation, profile_attributes: [:company_name, :business,  :country, :state, :mobile_no]) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name,:email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
    end
end




