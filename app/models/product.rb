class Product < ApplicationRecord

  def self.create_from_collection(products_list)
    products_list.each do |product_list_hash|
      product_list_hash[:images].each do |img|
        tempfile = URI.open(img)
        uploader = ImageUploader.new
        uploader.store! tempfile
      end

      Product.create(product_list_hash)
    end
  end
end
