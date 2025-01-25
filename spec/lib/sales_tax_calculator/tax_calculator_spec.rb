# frozen_string_literal: true

require "rspec"

RSpec.describe SalesTaxCalculator::TaxCalculator do
  describe ".calculate" do
    subject(:calculate) { described_class.calculate(item) }

    context "when the item is exempted and not imported" do
      let(:item) { instance_double(SalesTaxCalculator::Item, price: 12.49, exempted: true, imported: false) }

      it "returns 0" do
        expect(calculate).to eq(0)
      end
    end

    context "when the item is not exempted and not imported" do
      let(:item) { instance_double(SalesTaxCalculator::Item, price: 14.99, exempted: false, imported: false) }

      it "returns 1.5" do
        expect(calculate).to eq(1.5) # round to the nearest 0.05
      end
    end

    context "when the item is not exempted and is imported" do
      let(:item) { instance_double(SalesTaxCalculator::Item, price: 14.99, exempted: false, imported: true) }

      it "returns 2.25" do
        expect(calculate).to eq(2.25) # round to the nearest 0.05
      end
    end

    context "when the item is exempted and is imported" do
      let(:item) { instance_double(SalesTaxCalculator::Item, price: 12.49, exempted: true, imported: true) }

      it "returns 0.65" do
        expect(calculate).to eq(0.65) # round to the nearest 0.05
      end
    end
  end
end
