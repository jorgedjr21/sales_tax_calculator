require 'rspec'

require_relative '../../../lib/sales_tax_calculator/item_parser'

RSpec.describe ItemParser do
  let(:parser) { ItemParser.new }

  describe '#parse_file' do
    context 'with valid file content' do
      let(:file_path) { 'spec/fixtures/valid_items.txt' }

      it 'parses the file and returns an array of items' do
        items = parser.parse_file(file_path)
        expect(items).to eq([
          { quantity: 1, item_name: 'book', price: 12.49 },
          { quantity: 2, item_name: 'music CD', price: 14.99 }
        ])
      end
    end
  end
end
