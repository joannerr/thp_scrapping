require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

url = 'https://www.nosdeputes.fr/deputes'
url_depute = 'https://www.nosdeputes.fr/damien-abad'


def get_emails(address)
	document_email = open(address)
	content_email = document_email.read
	parsed_content_email = Nokogiri::HTML(content_email)

	return parsed_content_email.xpath("//a[starts-with(@href, \"mailto:\")]/@href")[0]
end
# puts get_emails(url_depute)


def url_all_deputes(link)
	document_deputes = open(link)
	content_deputes = document_deputes.read
	parsed_content_deputes = Nokogiri::HTML(content_deputes)

	complete_depute_url = parsed_content_deputes.css('.list_table').css('td a').map { |i| i['href'] }
		complete_depute_url.map do |u|
			"https://www.nosdeputes.fr" + u
		end
end
# puts url_all_deputes(url)

def get_all_emails(all)
	emails_deputes = url_all_deputes(all)

	emails_array = []

	emails_deputes.each do |e|
		puts emails_array << get_emails(e)
	end
end
get_all_emails(url)


# def name_depute(names)
# 	document_depute = open(names)
# 	content_depute = document_depute.read
# 	parsed_content_depute = Nokogiri::HTML(content_depute)

# 	return full_name = parsed_content_depute.css('.list_table).css('#list_nom')
# end 
# puts name_depute(url_depute)