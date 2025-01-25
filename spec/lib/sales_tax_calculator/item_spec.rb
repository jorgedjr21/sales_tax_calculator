# frozen_string_literal: true

require "rspec"

RSpec.describe SalesTaxCalculator::Item do
  describe "#initialize" do
    context "when the item is not imported and is exempted" do
      subject(:item) { described_class.new(name: "book", quantity: 1, price: 12.49) }

      it "sets the name" do
        expect(item.name).to eq("book")
      end

      it "sets the quantity" do
        expect(item.quantity).to eq(1)
      end

      it "sets the price" do
        expect(item.price).to eq(12.49)
      end

      it "sets imported to false" do
        expect(item.imported).to be false
      end

      it "sets exempted to true" do
        expect(item.exempted).to be true
      end

      it "calculates the tax" do
        expect(item.tax).to eq(0)
      end

      it "calculates the total price" do
        expect(item.total_price).to eq(12.49)
      end
    end
  end
end
