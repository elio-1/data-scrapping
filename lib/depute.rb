require 'rubygems'
require 'nokogiri'
require 'open-uri'

#find email
def array_get_townhall_email(cities_url)
  emails = []
  cities_url.each do |url|
    page = Nokogiri::HTML(URI.open(url))
    page.css('.deputes-liste-attributs > dd:nth-child(8) > ul:nth-child(1) > li:nth-child(2) > a:nth-child(1)').each do |fetch|
      emails.push(fetch.content)
    end
  end

  emails
end

#find url of deputy
def gets_urls
  page = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
  urls = []

  page.css('div.col-container > ul > li > a').each do |fetch|
    urls.push('http://www2.assemblee-nationale.fr' + fetch['href'])
  end

  urls
end

#fin the name of every town and stock in array
def gets_name
  page = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
  name = []

  page.css('div.col-container > ul > li > a').each do |fetch|
    name.push(fetch.content)
  end

  name
end

def program
  # Get an array of tawnhalls' names
  tawnhall_name_array = gets_name

  # Get an array containing all tawnhalls' URLS
  array_of_urls = gets_urls

  # Get an array emails
  tawnhall_email_array = array_get_townhall_email(array_of_urls)

  # Merge both arrays into a hash
  emails_hash = Hash[tawnhall_name_array.zip(tawnhall_email_array)]

  # Display all the town + the email of the mayor
  emails_hash.each do |key, value|
    puts key + ' : ' + value
  end
    rescue RuntimeError
end
def menu
user_choice = ""
	while user_choice != "2"
	print ' ' * 5
	puts "-" * 70
puts 		"""
    		1 - Trouver les emails des deputes
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


