class User < ActiveRecord::Base
  has_one :profile
  accepts_nested_attributes_for :profile

  COUNTRY = [["INDIA", "INDIA"]]
  STATE = [["Tamil Nadu", "Tamil Nadu"], ["Delhi", "Delhi"]]
  COMPANY = [["private", "private"], ["simple", "simple"]]
  BUSINESS = [["ACCOUNTING", "ACCOUNTING"], ["PRODUCT", "PRODUCT"]]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
