Product.destroy_all

scrape = Scraper.new
products = scrape.scrape_product_details
Product.create_from_collection(products)
