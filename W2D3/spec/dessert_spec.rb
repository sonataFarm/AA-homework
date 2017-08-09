require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:type) { 'cake' }
  let(:quantity) { 2 }
  let(:chef) { double("chef") }

  subject(:dessert) { Dessert.new(type, quantity, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq(type)
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(quantity)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      invalid_qty = 'cats'
      expect { Dessert.new(type, invalid_qty, chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      ingredient = 'fudge'
      dessert.add_ingredient(ingredient)
      expect(dessert.ingredients).to eq([ingredient])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = %w[
        fudge sprinkles peanuts gummy\ bears cone ice\ cream fruit pecans m&m's chocolate\ chips
      ]
      dessert.add_ingredient(ingredients.shift) until ingredients.empty?
      original = dessert.ingredients.dup
      dessert.mix!

      expect(dessert.ingredients).not_to eq(original)
      expect(dessert.ingredients.sort).to eq(original.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(1)
      expect(dessert.quantity).to eq(quantity - 1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(quantity + 1) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize)
      dessert.serve
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
