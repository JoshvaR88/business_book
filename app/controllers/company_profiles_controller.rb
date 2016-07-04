class CompanyProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_company_profile, only: [:show, :edit, :update, :destroy]

  def add_branch_address
    @company_profile = CompanyProfile.new
    @company_profile.office_addresses.build
    render json: {html: render_to_string("/company_profiles/_add_branch_address", layout: false, locals: {f: @company_profile })} and return
  end

  def dropdown
    conditional_dropdown_list(params[:selected])
  end

  def cin_no
    conditional_cin_no_list([:selected_list])
  end


  def new
    @company_profile = CompanyProfile.new
    @company_profile.office_addresses.build
    @company_profile.tax_deductions.build
    2.times do
      @company_profile.authorized_signatories.build
    end
  end

  def index
     @company_profiles = CompanyProfile.all
  end

  def show
  end

  def edit
  end

  def create
    @company_profile = CompanyProfile.new(company_profile_params)
    @company_profile.user = current_user
    respond_to do |format|
      if @company_profile.save
        format.html { redirect_to @company_profile, notice: 'companyprofile was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @company_profile.update(company_profile_params)
        format.html { redirect_to @company_profile, notice: 'company_profile was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_company_profile
    @company_profile = CompanyProfile.find(params[:id])
  end


  def company_profile_params
    params.require(:company_profile).permit(:company_name, :email, :company_website, :company_type, :pan_no, :corp_id_no, :accounting_mode, office_addresses_attributes: [:branch_address, :state, :telephone_no], tax_deductions_attributes: [:tan_no, :cit_address, :deductor_collector, :responsibility_tax_person, :designation], authorized_signatories_attributes: [:person_name, :person_position, :person_id_no])

  end

end
