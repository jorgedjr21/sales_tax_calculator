# frozen_string_literal: true

require_relative "sales_tax_calculator/version"
require_relative "sales_tax_calculator/item"
require_relative "sales_tax_calculator/file_parser"

# SalesTaxCalculator module provides functionality to parse an input file
# and calculate sales tax
module SalesTaxCalculator
  class Error < StandardError; end

  def self.run(file_path)
    parser = FileParser.new(file_path: file_path)
    puts parser.parse_file
  end
end
