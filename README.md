# SalesTaxCalculator

The SalesTaxCalculator gem provides functionality to parse an input file, calculate sales tax for items based on specific rules, and print a receipt with the total sales taxes and total price.

## Installation

**This gem requires ruby 3.3 to run**
Clone this repo to you machine. To keep the simplicity, this gem is not released.

## Usage
To use the SalesTaxCalculator gem, you need to provide an input file with the list of items. Each line in the input file should be in the following format:

```
<quantity> <item name> at <price>
```

Example:

```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

## Using Docker and Makefile
You can also use Docker and Makefile to run the specs and the SalesTaxCalculator.

**Setup the environment**
```
make build
```

**Run the specs**
```
make test
```

**Run the SalesTaxCalculator**
```
make run
```

Make sure to replace './example_input.txt' with the actual path to your input file in the Makefile. This one is just an example.
