class CompanyProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_company_profile, only: [:show, :edit, :update, :destroy]

  def dropdown
    conditional_dropdown_list(params[:selected])

  end

  def new
    @company_profile = CompanyProfile.new
    @company_profile.office_addresses.build
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
    params.require(:company_profile).permit(:company_name, :email, :company_website, :company_type, :pan_no, :corp_id_no, office_addresses_attributes: [:branch_address, :state, :telephone_no], authorized_signatories_attributes: [:person_name, :person_position, :person_id_no])

  end

end
