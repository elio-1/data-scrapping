require 'rubygems'
require 'nokogiri'
require 'open-uri'

#find email
def array_get_townhall_email(cities_url)
  emails = []
  cities_url.each do |url|
    page = Nokogiri::HTML(URI.open(url))
    page.css('table.table:nth-child(1) > tbody:nth-child(3) > tr:nth-child(4) > td:nth-child(2)').each do |fetch|
      emails.push(fetch.content)
    end
  end

  emails
end

#find url of every town
def gets_urls
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  urls = []

  page.css('a.lientxt').each do |fetch|
    urls.push('http://annuaire-des-mairies.com/' + fetch['href'])
  end

  urls
end

#fin the name of every town and stock in array
def gets_name
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  name = []

  page.css('a.lientxt').each do |fetch|
    name.push(fetch.content)
  end

  name
end

def program
  # Get the names of the townhalls
  tawnhall_name_array = gets_name

  # Get an array of URLS
  array_of_urls = gets_urls

  # Get array with emails
  tawnhall_email_array = array_get_townhall_email(array_of_urls)

  # Merge both arrays into a hash
  emails_hash = Hash[tawnhall_name_array.zip(tawnhall_email_array)]

  emails_hash.each do |key, value|
    puts key + ' : ' + value
  end
end
def menu
user_choice = ""
	while user_choice != "2"
	print ' ' * 5
	puts "-" * 70
puts 		"""
    		1 - Trouver les emails des maires du Val-D'Oise
    		2 - Quitter le programme
			"""
			print ' ' * 5
			puts "-" * 70
			print "Tapez ce que vous voulez faire > "
		user_choice = gets.chomp
		case user_choice
		when "1"
		  puts 'fetching data...'
			program
			puts 'Bye'
			user_choice = "2"
		end
		
		
	end
end
# Run the program
menu


