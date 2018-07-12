require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = 'https://coinmarketcap.com/all/views/all/'


	document = open(url)
	content = document.read
	parsed_content = Nokogiri::HTML(content)

puts parsed_content.css('tbody').css('tr[id]')['.class']['role']


