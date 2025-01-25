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

    context "when the item is imported and is not exempted" do
      subject(:item) { described_class.new(name: "imported bottle of perfume", quantity: 1, price: 47.50) }

      it "sets the name" do
        expect(item.name).to eq("imported bottle of perfume")
      end

      it "sets the quantity" do
        expect(item.quantity).to eq(1)
      end

      it "sets the price" do
        expect(item.price).to eq(47.50)
      end

      it "sets imported to true" do
        expect(item.imported).to be true
      end

      it "sets exempted to false" do
        expect(item.exempted).to be false
      end

      it "calculates the tax" do
        expect(item.tax).to eq(7.15) # 10% + 5% of 47.50 rounded up to the nearest 0.05
      end

      it "calculates the total price" do
        expect(item.total_price).to eq(54.65)
      end
    end

    context "when the item is imported and is exempted" do
      subject(:item) { described_class.new(name: "imported box of chocolates", quantity: 1, price: 10.00) }

      it "sets the name" do
        expect(item.name).to eq("imported box of chocolates")
      end

      it "sets the quantity" do
        expect(item.quantity).to eq(1)
      end

      it "sets the price" do
        expect(item.price).to eq(10.00)
      end

      it "sets imported to true" do
        expect(item.imported).to be true
      end

      it "sets exempted to true" do
        expect(item.exempted).to be true
      end

      it "calculates the tax" do
        expect(item.tax).to eq(0.50) # 5% of 10.00 rounded up to the nearest 0.05
      end

      it "calculates the total price" do
        expect(item.total_price).to eq(10.50)
      end
    end
  end
end
