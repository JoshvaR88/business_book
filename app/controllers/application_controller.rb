class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def conditional_dropdown_list(selected)
    case selected
    when "Private"
      a = ["Managing Director","Whole Time Director","Director"]
      dropdown_list =  a.zip(a)
    when "LLP"
      a = ["Partner","Executive Partner"]
      dropdown_list =  a.zip(a)
    when "OPC"
      a = ["Managing Director","Whole Time Director","Director"]
      dropdown_list =  a.zip(a)
    when "Partnership Firm"
      a = ["Partner","Partner"]
      dropdown_list =  a.zip(a)
    when "Sole Proprietorship"
      a = ["Sole Proprietorship"]
      dropdown_list =  a.zip(a)
    else
    end

    render json: {html: render_to_string("/company_profiles/_append_conditional_dropdown_list", layout: false, locals: {t: AuthorizedSignatory.new, dropdown_list: dropdown_list})} and return
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :email, :password, :first_name, :last_name, :user_id, :password_confirmation, profile_attributes: [:company_name, :business,  :country, :state, :mobile_no]) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name,:email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
    end
end




