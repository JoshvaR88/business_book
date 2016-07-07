class User < ActiveRecord::Base
  has_one :profile
  has_one :company_profile
  accepts_nested_attributes_for :profile


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
