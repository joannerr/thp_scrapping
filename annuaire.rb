require 'rubygems'
require 'nokogiri'
require 'open-uri'


url = 'http://annuaire-des-mairies.com/95/vaureal.html'
url2 = 'http://annuaire-des-mairies.com/val-d-oise.html'

# L'ADRESSE MAIL MAIRIE VAUREAL
def get_the_email_of_a_townhall_from_its_webpage(link)
	document_mairie = open(link)
	content_mairie = document_mairie.read
	parsed_content_mairie = Nokogiri::HTML(content_mairie)

	return parsed_content_mairie.css('.well.section-border').css('td')[7].text
	
end

# puts 
# get_the_email_of_a_townhall_from_its_webpage(url)


# LES URL MAIRIES VAL D'OISE
def get_all_the_urls_of_val_doise_townhalls(link2)
	document_mairies = open(link2)
	content_mairies = document_mairies.read
	parsed_content_mairies = Nokogiri::HTML(content_mairies)

	url_townhall = parsed_content_mairies.css('.Style20').css('.lientxt').map { |i| i['href'] }

		url_townhall.each do |u|
			u[0] = ""
		end

		url_townhall.map do |u|
			'http://annuaire-des-mairies.com' + u
		end
end

# get_all_the_urls_of_val_doise_townhalls(url2)


# LES ADRESSES MAIL DES MAIRIES DU 95
def email_valdoise(link3)
	url_valdoise = get_all_the_urls_of_val_doise_townhalls(link3)

	url_valdoise.each do |l|
		if get_the_email_of_a_townhall_from_its_webpage(l).empty? == false
		puts finish = get_the_email_of_a_townhall_from_its_webpage(l)
		end
	end
end

email_valdoise('http://annuaire-des-mairies.com/val-d-oise.html')

