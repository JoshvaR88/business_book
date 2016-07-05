class SalesConfigurationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_sales_configuration, only: [:show, :edit, :update, :destroy]


  def new
    @sales_configuration = SalesConfiguration.new
    @sales_configuration.build_sales_tax
    @sales_configuration.build_sales_tax_additional_info
    @sales_configuration.build_sales_tax_central
    @sales_configuration.build_service_tax
    @sales_configuration.build_service_tax_additional_info
  end

  def create
    @sales_configuration = SalesConfiguration.new(sales_configuration_params)
    @sales_configuration.company_profile_id = current_user.company_profile.id rescue nil
    respond_to do |format|
      if @sales_configuration.save
        format.html { redirect_to @sales_configuration, notice: 'sales configuration was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def index
     @sales_configuration = SalesConfiguration.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def checkbox
    checkbox_conditional_list(params[:multiselected])
  end

  private

  def set_sales_configuration
    @sales_configuration = SalesConfiguration.find(params[:id])
  end

  def sales_configuration_params
    params.require(:sales_configuration).permit(:invoice_reg_office, {:tax_organization => []}, :invoice_outside_branch_state, sales_tax_attributes: [:vat_type, :tax_reg_no,:tax_date], sales_tax_additional_info_attributes: [:reg_circle, :division, :area_code, :authorized_person_name, :designation, :ie_code], sales_tax_central_attributes: [:state, :central_sales_tax, :central_reg_no, :central_tax_date], service_tax_attributes: [:service_type, :service_tax_reg_no, :large_tax_payer], service_tax_additional_info_attributes: [:commissionerate_name, :commissionerate_code, :address, :jurisdiction, :division_name, :division_code, :range_name, :range_code, :range_address, :range_jurisdiction])
  end


end


# @contact.birth_day = (Date.strptime(params[:contact][:birth_day], Date::DATE_FORMATS[:default]) rescue nil)
