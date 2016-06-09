class User < ActiveRecord::Base
  has_one :profile
  accepts_nested_attributes_for :profile

  COUNTRY = [["INDIA", "INDIA"], ["USA", "USA"]]
  COMPANY = [["private", "private"], ["simple", "simple"]]
  BUSINESS = [["ACCOUNTING", "ACCOUNTING"], ["PRODUCT", "PRODUCT"]]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
