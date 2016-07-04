module DropdownList
  # extend ActiveSupport::Concern
  #rang of int
  TWO_INT = (1..2).to_a
  FIVE_INT = (1..5).to_a
  SIX_INT = (1..6).to_a

  #dropdown string
  COMPANY = ["Private", "LLP", "OPC", "Partnership Firm","Sole proprietorship"]
  POSITION = ["Managing Director", "Whole Time Director", "Director", "Partner","Sole Proprietorship", "Executive Partner"]
  AC = ['Accounting', 'Accounting and Inventory']
  DEDUCTOR_COLLECTOR = ["Government", "Non-Government"]
  CHECKBOX = ["Sales of Goods", "Sales of Services", "Sales of Export Goods", "Sales of Export Services"]

  VAT_TYPE = ["Regular", "Composition"]

  #zip for two constant
  LIST_OF_COMPANY = COMPANY.zip(FIVE_INT)
  POSITION_LIST = POSITION.zip(SIX_INT)
  AC_TYPE = AC.zip(TWO_INT)
  DEDUCTOR_COLLECTOR_TYPE = DEDUCTOR_COLLECTOR.zip(TWO_INT)
  CHECKBOX_LIST = CHECKBOX.zip(CHECKBOX)
  VAT_TYPE_LIST = VAT_TYPE.zip(TWO_INT)

end








