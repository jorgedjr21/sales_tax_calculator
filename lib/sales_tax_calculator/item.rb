# frozen_string_literal: true

module SalesTaxCalculator
  # The Item class represents a product with its attributes.
  # It determines if the item is imported and/or exempted from basic sales tax.
  class Item
    attr_reader :name, :price, :quantity, :imported, :exempted, :tax, :total_price

    EXEMPT_ITEMS = %w[book chocolate pill].freeze

    def initialize(name:, quantity:, price:)
      @name = name
      @quantity = quantity
      @price = price
      @imported = name.include?("imported")
      @exempted = EXEMPT_ITEMS.any? { |item| name.include?(item) }

      calculate_tax_and_total_price
    end

    private

    def calculate_tax_and_total_price
      @tax = TaxCalculator.calculate(self)
      @total_price = price + tax
    end
  end
end
