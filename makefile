build:
	docker compose build
test:
	docker compose run --rm gem bundle exec rspec
run:
	docker compose run --rm gem ruby -r "./lib/sales_tax_calculator" -e "SalesTaxCalculator.run('./example_input.txt')"
