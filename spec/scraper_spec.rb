require 'rails_helper'
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'capybara/dsl'
require 'selenium-webdriver'

describe Scraper do

  context '.scrape_product_url' do
        
    # let(:scrape) {Scraper.new}
    # let(:scrape_product_url) {scrape.scrape_product_url}

    # it "returns an array" do
    #   expect(scrape_product_url).to be_kind_of(Array)
    # end

    # it 'returns an array that is not empty' do
    #   expect(scrape_product_url.size).to be > 0
    # end

    doc = 'https://www.gearbubble.com/category/top-sellers'

    it "result" do
      expect(doc).to have_search('*[@class="row"]//li')
    end

  end
end