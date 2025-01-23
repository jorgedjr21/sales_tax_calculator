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
        items << line
      end
      items
    end
  end
end
