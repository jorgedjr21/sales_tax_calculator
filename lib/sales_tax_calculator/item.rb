# frozem_string_literal: true

module SalesTaxCalculator
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
