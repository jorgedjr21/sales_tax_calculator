# frozen_string_literal: true

require "rspec"

RSpec.describe SalesTaxCalculator::Receipt do
  describe "#calculate_totals" do
    subject(:receipt) { described_class.new(items: items) }

    let(:items) do
      [
        SalesTaxCalculator::Item.new(name: "book", price: 12.49, quantity: 2),
        SalesTaxCalculator::Item.new(name: "music CD", price: 14.99, quantity: 1),
        SalesTaxCalculator::Item.new(name: "chocolate bar", price: 0.85, quantity: 1)
      ]
    end

    it "calculates the total sales tax" do
      expect(receipt.sales_taxes).to eq(1.50)
    end

    it "calculates the total price" do
      expect(receipt.total).to eq(42.32)
    end
  end

  describe "#print" do
    subject(:receipt) { described_class.new(items: items) }

    let(:items) do
      [
        SalesTaxCalculator::Item.new(name: "book", price: 12.49, quantity: 2),
        SalesTaxCalculator::Item.new(name: "music CD", price: 14.99, quantity: 1),
        SalesTaxCalculator::Item.new(name: "chocolate bar", price: 0.85, quantity: 1)
      ]
    end

    it "prints the receipt" do
      expect { receipt.print }.to output(
        "2 book: 24.98\n" \
        "1 music CD: 16.49\n" \
        "1 chocolate bar: 0.85\n" \
        "Sales Taxes: 1.50\n" \
        "Total: 42.32\n"
      ).to_stdout
    end
  end
end
