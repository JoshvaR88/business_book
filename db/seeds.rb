# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
countries = [{ name:'India', phone_country_code: '+91', currency: 'INR'}]
states = ["Andaman and Nicobar Islands", "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chandigarh", "Chhattisgarh", "Dadra and Nagar Haveli", "Daman and Diu", "Delhi", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Lakshadweep", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Orissa", "Pondicherry", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh","Uttarakhand", "Uttaranchal", "West Bengal"]
business_types = ["Advertisement Agency", "Beauty Parlor / Spa", "Brokerage and Commission Agency", "Cargo Handling", "Catering Services", "Chartered Accountancy/Company Secretaries/ Cost Accountancy", "Clearing and Forwarding Agency", "Consultancy Services / Professional Services", "Educational / Technical soft skills training", "Export of Sales/ Services", "Human Resources / Recruitment Services", "Information Technologies Software Services", "Interior Design Services and relating", "Internet Center / Cafe", "Legal Consultancy Service", "Manufacturing of Export Services", "Market Researching & Analyzing Agency", "Motor Vehicle Service Agency", "Packaging Services", "Photography,Video Coverage Services", "Security Services Agency", "Telegram/Courier Agency", "Travel Agency", "Travel Ticket Booking Agency", "Work Contract Services"]

countries.each do |c|
  p "load country"
  country = Country.create!(c)
  states.each do |s|
    p "load state"
    state = country.states.new(name: s).save!
  end
end

business_types.each do |b|
  p "load business_types"
  BusinessType.create!(name: b)
end
