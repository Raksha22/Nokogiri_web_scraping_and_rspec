require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:products_list) {[{title: "Dog Dad Funny Mug...", price: "$19.95", images: ['https://gearbubble-assets.s3.amazonaws.com/5/2849243/20/235/front.png', 'https://gearbubble-assets.s3.amazonaws.com/5/2849243/20/235/back.png']}]}
                      
  let(:products) {Product.create_from_collection(products_list)}

  it "should return an array" do
    expect(products).to be_kind_of(Array)
  end

  it 'returns an array that is not empty' do
    expect(products.size).to be > 0
  end
end
