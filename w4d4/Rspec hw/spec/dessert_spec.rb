require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:brownie) {Dessert.new("baked", 3, :chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("baked")
    end
    it "sets a quantity" do
      expect(brownie.quantity).to eq(3)
    end
    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect {initialize("baked", -3, :chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("flour")
      expect(brownie.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(brownie.ingredients).to_not eq(Array.shuffle!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
