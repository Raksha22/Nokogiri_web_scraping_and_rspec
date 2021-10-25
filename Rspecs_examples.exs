let(:scrape) {Scraper.new}
let(:scrape_product_url) {scrape.scrape_product_url}
let(:doc) {Nokogiri::HTML::Document}

it 'should returns a Nokogiri::HTML::Document' do
  expect(scrape_product_url).to be_a(doc)
end


    # it 'should returns a Nokogiri::HTML::Document' do
    #   expect(scrape_product_url).to be_a(doc)
    # end
    # it "should return products_list" do
    #   products_list_hash = [
    #                         {:title=>"Dog Dad Funny Mug...",
    #                         :price=>"$19.95",
    #                         :images=>
    #                         ["https://gearbubble-assets.s3.amazonaws.com/5/2849243/20/235/front.png", "https://gearbubble-assets.s3.amazonaws.com/5/2849243/20/235/back.png"]}]

    #   expect(scrape_product_url).to eq (products_list_hash)
    # end
    # Capybara.default_driver = :chrome,
    # Capybara.javascript_driver = :chrome,
    # # Capybara.current_driver = Capybara.javascript_driver,
    # Capybara.default_selector = :search,
    # Capybara.app_host = 'https://www.gearbubble.com/category/top-sellers'
