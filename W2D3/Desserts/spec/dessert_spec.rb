require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => "Moe") }
  subject(:cookies) { Dessert.new("cookies",10,chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cookies.type).to eq("cookies")
    end

    it "sets a quantity" do
      expect(cookies.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(cookies.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cookies", "10", chef) }.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cookies.ingredients).to_not include("chocolate")
      cookies.add_ingredient("chocolate")
      expect(cookies.ingredients).to include("chocolate")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do

      list = ["milk", "flour", "eggs"]

      list.reverse.each do |item|
        cookies.ingredients << item
      end

      expect(cookies.ingredients).to eq(list.reverse)
      cookies.mix!
      expect(cookies.ingredients).not_to eq(list.reverse)
      expect(cookies.ingredients.sort).to eq(list.reverse)
    end
  end

  describe "#eat" do

    it "subtracts an amount from the quantity" do
      cookies.eat(5)
      expect(cookies.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookies.eat(20) }.to raise_error("not enough left!")
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Moe the Great Baker has made 10 cookiess!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookies)
      cookies.make_more
    end
  end
end
