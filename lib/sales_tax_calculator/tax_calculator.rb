# frozen_string_literal: true

module SalesTaxCalculator
  # The TaxCalculator class calculates the sales tax for a given item.
  # It applies basic sales tax and import duty based on the item's attributes.
  # The tax is rounded up to the nearest 0.05
  # Example usage:
  # item = SalesTaxCalculator::Item.new(quantity: 1, name: "music CD", price: 14.99)
  # tax = SalesTaxCalculator::TaxCalculator.calculate(item)
  # puts tax # => 1.50
  class TaxCalculator
    BASIC_SALES_TAX_RATE = 0.1
    IMPORT_DUTY_RATE = 0.05

    def self.calculate(item)
      tax = 0
      tax += item.price * BASIC_SALES_TAX_RATE unless item.exempted
      tax += item.price * IMPORT_DUTY_RATE if item.imported
      (tax * 20).ceil / 20.0 # round to nearest 0.05
    end
  end
end
