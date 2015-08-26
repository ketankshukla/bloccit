require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:advertisement) { Advertisement.create!(title: "New Advertisement Title", copy: "New Ad Copy", price: "New Ad Price") }

  context "attributes" do

    it "should respond to title" do
      expect(advertisement).to respond_to(:title)
    end

    it "should respond to copy" do
      expect(advertisement).to respond_to(:copy)
    end

    it "should respond to price" do
      expect(advertisement).to respond_to(:price)
    end
  end

end
