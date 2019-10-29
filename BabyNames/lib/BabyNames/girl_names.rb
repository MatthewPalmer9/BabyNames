require 'open-uri'
require 'nokogiri'

class GirlNames < BabyNames::CLI

  def initialize
    @girl_array = []
  end

  def girl_names
    html = open("https://www.ssa.gov/oact/babynames/")
    doc = Nokogiri::HTML(html)

    doc.css("td:nth-child(3)").each(){|name|
      @girl_array << name.text if !@girl_array.include?(name.text)
    }
  end

  def call_girl_table
    count = 1
    puts "<<{}--[#{Scraper.new.rank}]-[#{Scraper.new.female_names}]--{}>>"
    @girl_array.each(){|name|
      puts "   >>  [#{count}]:" + "     #{name}" unless count == 10
      count += 1
    }
    puts "   >>  [#{count-1}]:" + "    #{@girl_array[9]}"
    puts "<<{}---------END-----------{}>>"

    BoyNames.new.boys_this_time?
  end

  def girls_this_time?
  puts " "
  puts "//////////////////////////////////"
  puts "Would you like to know girl names?"
  puts "(type 'yes' or 'no')"
  puts "//////////////////////////////////"
  answer = gets.chomp

    if answer == "no" || answer == "No" || answer == "exit"
      puts "Goodbye! :)"
    elsif answer == "yes" || answer == "Yes"
      puts " "
      girl_names
      call_girl_table
    elsif answer != "yes" || answer != "Yes" || answer != "no" || answer != "No"
      puts " "
      puts "Sorry, that is an invalid response."
      puts "Please type 'yes' or 'no'."
      puts " "
      puts "--!! HELP !!--"
      puts "If you're trying to exit, please type 'exit'."
      girls_this_time?
    end
  end

end
