# frozen_string_literal: true

module SalesTaxCalculator
  # The Receipt class represents a receipt for a list of items.
  # It calculates the total sales taxes and total price for the items,
  # and provides a method to print the receipt.
  class Receipt
    attr_reader :items, :sales_taxes, :total

    def initialize(items:)
      @items = items
      @sales_taxes = 0
      @total = 0
      calculate_totals
    end

    def calculate_totals
      items.each do |item|
        @sales_taxes += item.tax * item.quantity
        @total += item.total_price * item.quantity
      end
    end

    def print
      items.each do |item|
        puts format_item_output(item)
      end

      puts format("Sales Taxes: %.2f", sales_taxes)
      puts format("Total: %.2f", total)
    end

    private

    def format_item_output(item)
      "#{item.quantity} #{item.name}: #{format("%.2f", item.total_price * item.quantity)}"
    end
  end
end
