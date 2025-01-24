# frozen_string_literal: true

require "rspec"

RSpec.describe SalesTaxCalculator::FileParser do
  let(:parser) { described_class.new(file_path:) }

  describe "#parse_file" do
    context "with valid file content" do
      let(:file_path) { "spec/fixtures/valid_items.txt" }

      it "parses the file and returns an array of items" do
        items = parser.parse_file
        expect(items).to eq([
                              { quantity: 1, item_name: "book", price: 12.49 },
                              { quantity: 2, item_name: "music CD", price: 14.99 }
                            ])
      end
    end

    context 'with invalid file content' do
      let(:file_path) { 'spec/fixtures/invalid_items.txt' }

      it 'returns an empty array' do
        items = parser.parse_file
        expect(items).to eq([])
      end
    end

    context 'with empty file' do
      let(:file_path) { 'spec/fixtures/empty_items.txt' }

      it 'returns an empty array' do
        items = parser.parse_file
        expect(items).to eq([])
      end
    end

    context 'with mixed valid and invalid lines' do
      let(:file_path) { 'spec/fixtures/mixed_items.txt' }

      it 'parses only the valid lines and returns an array of items' do
        items = parser.parse_file
        expect(items).to eq([
          { quantity: 1, item_name: 'book', price: 12.49 },
          { quantity: 2, item_name: 'music CD', price: 14.99 }
        ])
      end
    end

    context 'with multiple valid formats' do
      let(:file_path) { 'spec/fixtures/multiple_valid_items.txt' }

      it 'parses the file and returns an array of items' do
        items = parser.parse_file
        expect(items).to eq([
          { quantity: 3, item_name: 'chocolate bar', price: 0.85 },
          { quantity: 1, item_name: 'packet of headache pills', price: 9.75 },
          { quantity: 1, item_name: "book", price: 12.49 },
          { quantity: 2, item_name: "music CD", price: 14.99 }
        ])
      end
    end
  end
end
