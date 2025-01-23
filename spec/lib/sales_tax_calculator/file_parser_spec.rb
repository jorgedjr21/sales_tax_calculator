require 'rspec'

RSpec.describe SalesTaxCalculator::FileParser do
  let(:parser) { described_class.new(file_path:) }

  describe '#parse_file' do
    context 'with valid file content' do
      let(:file_path) { 'spec/fixtures/valid_items.txt' }

      it 'parses the file and returns an array of items' do
        items = parser.parse_file
        expect(items).to eq([
          { quantity: 1, item_name: 'book', price: 12.49 },
          { quantity: 2, item_name: 'music CD', price: 14.99 }
        ])
      end
    end
  end
end
