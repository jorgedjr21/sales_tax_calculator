# frozen_string_literal: true

module SalesTaxCalculator
  # Parses the input file and return an array of items
  class FileParser
    attr_reader :file_path

    def initialize(file_path:)
      @file_path = file_path
    end

    def parse_file
      items = []
      File.foreach(file_path) do |line|
        # https://rubular.com/r/q66OaTRkKDl2yB
        match_data = line.match(/(\d+)\s(.+)\sat\s(\d+\.\d+)/)
        next unless match_data

        quantity = match_data[1].to_i
        item_name = match_data[2]
        price = match_data[3].to_f

        items << { quantity: quantity, item_name: item_name, price: price }
      end
      items
    end
  end
end
