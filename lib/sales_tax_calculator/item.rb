# frozen_string_literal: true

module SalesTaxCalculator
  # The Item class represents a product with its attributes.
  # It determines if the item is imported and/or exempted from basic sales tax.
  class Item
    attr_reader :name, :price, :quantity, :imported, :exempted

    EXEMPT_ITEMS = %w[book chocolate pill].freeze

    def initialize(name:, quantity:, price:)
      @name = name
      @quantity = quantity
      @price = price
      @imported = name.include?("imported")
      @exempted = EXEMPT_ITEMS.any? { |item| name.include?(item) }
    end
  end
end
