# frozen_string_literal: true

module SalesTaxCalculator
  class Receipt
    attr_reader :items, :sales_taxes, :total

    def initialize(items:)
      @items = items
      @sales_taxes = 0
      @total = 0
    end
  end
end
