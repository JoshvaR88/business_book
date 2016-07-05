class CustomerDetailsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_customer_detail, only: [:show, :edit, :update, :destroy]

  def create
    @customer_detail = CustomerDetail.new(customer_detail_params)
    @customer_detail.company_profile_id = current_user.company_profile.id
    respond_to do |format|
      if @customer_detail.save
        format.html { redirect_to @customer_detail, notice: 'customerDetails was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def new
    @customer_detail = CustomerDetail.new
    @customer_detail.build_customer_goods_detail
  end

  def index
    @customer_details = CustomerDetail.all
  end

  def show
  end

  def destroy
  end

  def update
  end

  private

    def set_customer_detail
      @customer_detail = CustomerDetail.find(params[:id])
    end

    def customer_detail_params
      params.require(:customer_detail).permit(:address, :residential_status_type, :customer_name, :attention_to, :billing_address, :email, :contact_number, customer_goods_detail_attributes: [:state, :pin_code, :customer_business_type, :customer_pan_no, :service_tax_no, :local_sales_tax_no, :central_sales_tax_no, :goods_address, :delivery_address, :email, :contact_no, :customer_detail_id, :delivery_state, :state_code])
    end

  end

