# frozen_string_literal: true

module SalesTaxCalculator
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
        tax = TaxCalculator.calculate(item)
        total_price = item.price + tax
        @sales_taxes += tax * item.quantity
        @total += total_price * item.quantity
      end
    end

    def print
      items.each do |item|
        tax = TaxCalculator.calculate(item)
        total_price = item.price + tax
        puts "#{item.quantity} #{item.name}: #{format("%.2f", (total_price * item.quantity))}"
      end

      puts "Sales Taxes: #{"%.2f" % sales_taxes}"
      puts "Total: #{"%.2f" % total}"
    end
  end
end
