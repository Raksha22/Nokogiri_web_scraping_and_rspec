require 'nokogiri'
require 'open-uri'
require 'pry'
require 'json'
require 'csv'
require 'mechanize'
require 'watir'
class Scraper

  def scrape_product_details
    doc = Nokogiri::HTML(URI.open('https://www.gearbubble.com/category/top-sellers'))

    products = doc.search('*[@class="row"]//li')

    products_list = []

    products.each do |product|
      name = product.css('.field-title.text-center').css('a').text
      price = product.css('.inner-circle').text
      image = product.xpath('*[@class="image-block"]//*[@class="card"]//img')

      product_image = []

      image.each do |img|
        images = img.attribute('src').value
        product_image << images
      end

      if name != ""
        product_info ={
          title: name,
          price: price,
          images: product_image
        }
        products_list << product_info
      end
    end

    File.open("products.json","w") do |f|
      f.write(JSON.pretty_generate(products_list))
    end

    CSV.open('products.csv', "w") do |csv|
      csv << ['title', 'price', 'images'] 
      JSON.parse(File.open("products.json").read).each do |hash|
        csv << hash.values
      end
    end

    products_list
  end
end
# scrape = Scraper.new
# products = scrape.scrape_product_details

=begin

................................SCRAPE DYNAMIC DATA(JS)...............................


class Scraper

  def scrape_product_details
    browser = Watir::Browser.new
    browser.goto('https://www.nbcsportsedge.com/edge/basketball/nba/player-news')
    js_doc = browser.element(css: '.player-news-wrapper').wait_until(&:present?)
    doc = Nokogiri::HTML(js_doc.inner_html)
    articles = doc.search('//article')

    profile = []

    articles.each do |article|
      name = article.css('.player-news-article__profile__name').css('a').text
      team = article.css('.player-news-article__profile__position').css('a').text
      photo = article.css('.player-news-article__photo').css('img').attribute('src').value
      photo_url = "https://www.nbcsportsedge.com#{photo}"

      profile_info ={
        name: name,
        team: team,
        photo_url: photo_url
      }
      profile << profile_info
    end

    profile

    File.open("profile.json","w") do |f|
      f.write(JSON.pretty_generate(profile))
    end

    CSV.open('profile.csv', "w") do |csv|
      csv << ['name', 'team', 'photo_url'] 
      JSON.parse(File.open("profile.json").read).each do |hash|
        csv << hash.values
      end
    end
  end
end



................................SCRAPE MULTIPLE PAGES.................................

class Scraper

  def initialize
    @agent = Mechanize.new
  end

  def scrape_product_details
    doc = @agent.get('https://www.gearbubble.com/category/top-sellers')

    products_list = []

    num_pages_to_scrape = 50
    page_num = 1

    while(num_pages_to_scrape >= page_num)
      products = doc.parser.search('*[@class="row"]//li')

      products.each do |product|
        name = product.css('.field-title.text-center').css('a').text
        price = product.css('.inner-circle').text
        image = product.xpath('*[@class="image-block"]//*[@class="card"]//img')
  
        product_image = []
  
        image.each do |img|
          images = img.attribute('src').value
          product_image << images
        end
  
        if name != ""
          product_info ={
            title: name,
            price: price,
            images: product_image
          }
          products_list << product_info
        end
      end
      products_list
      page_num +=1
      doc = @agent.get("https://www.gearbubble.com/category/top-sellers/?page=#{page_num}")
    end

    File.open("products.json","w") do |f|
      f.write(JSON.pretty_generate(products_list))
    end

    CSV.open('products.csv', "w") do |csv|
      csv << ['title', 'price', 'images'] 
      JSON.parse(File.open("products.json").read).each do |hash|
        csv << hash.values
      end
    end
    
    products_list
  end
end



.................................SCRAPE SINGLE PAGE...................................


require 'nokogiri'
require 'open-uri'
require 'pry'
require 'json'
require 'csv'

class Scraper

  def scrape_product_details
    doc = Nokogiri::HTML(URI.open('https://www.gearbubble.com/category/top-sellers'))

    products = doc.search('*[@class="row"]//li')

    products_list = []

    products.each do |product|
      name = product.css('.field-title.text-center').css('a').text
      price = product.css('.inner-circle').text
      image = product.xpath('*[@class="image-block"]//*[@class="card"]//img')

      product_image = []

      image.each do |img|
        images = img.attribute('src').value
        product_image << images
      end

      if name != ""
        product_info ={
          title: name,
          price: price,
          images: product_image
        }
        products_list << product_info
      end
    end

    File.open("products.json","w") do |f|
      f.write(JSON.pretty_generate(products_list))
    end

    CSV.open('products.csv', "w") do |csv|
      csv << ['title', 'price', 'images'] 
      JSON.parse(File.open("products.json").read).each do |hash|
        csv << hash.values
      end
    end

    products_list
  end 
end


scrape = Scraper.new
products = scrape.scrape_product_details



........................................OBJECT..............................................


   scrape = Scraper.new
   products = scrape.scrape_product_details



...........................REJECT EMPTY STRING OF AN ARRAY..................................


     products = doc.css('ul.list-inline.add-product-list').css('li.col-md-4.clear-left').css('a')

     products.each do |product|
     list << product.css('h4.field-title').css('a').text
     end
     products_list = list.reject(&:empty?)



...........................LOOP OF IMAGE TO STORE IN JSON(OBJECT)...........................


     product_images.each do |img|
        image = img.css('img').attribute('src').value
        product_image ={
          image: image
        }
        products_list << product_image
     end


...........................NOKOGIRI METHODS................................................


    CSS........................................

      image = product.css('div.image-block').css('img')

    XPATH......................................

      name = product.xpath('*[@class="field-title text-center"]/a').count
      image = product.xpath('*[@class="image-block"]//img')

    SEARCH.....................................

      image = product.search('*[@class="image-block"]//img')


=end