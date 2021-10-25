require 'rails_helper'

RSpec.describe 'Products', type: :request do

#..................Controller...............(blank)
  # it "assigns all products to @products" do
  #  get products_path
  #  expect(assigns(:products)).to eq(Product.all)
  # end


#........................Request...........(render html)
  # describe 'GET #index' do
  #   before(:example) { get products_path }  # get(:index)
  #   it "is a success" do
  #     expect(response).to have_http_status(:ok)
  #   end
  #   it "renders 'index' template" do
  #     expect(response).to render_template('index')
  #   end
  # end


#...............Request................(json)
  describe "request list of all products", type: :request  do
    product = Product.create(title: "Test user", price: "$30", images: "https://gearbubble-assets.s3.amazonaws.com/5/2849243/20/235/front.png")
    it "should include product attributes" do
      get products_path
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Test user", "$30", "https://gearbubble-assets.s3.amazonaws.com/5/2849243/20/235/front.png")
    end
  end
end
