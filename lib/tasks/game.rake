task :game do
  xml_file_data = Nokogiri::XML(open("http://www.kongregate.com/games_for_your_site.xml"))
  xml_file_data.xpath("//game").each do |data|
    %w[id title thumbnail category description instructions].each do |d|
    #concat node name & its value 
     p "#{d}: #{data.at(d).text}"
    # puts data.at(d)
    # puts data.at(d).text
    end
  end
end