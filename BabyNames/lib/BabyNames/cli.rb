require 'open-uri'
require 'nokogiri'

class BabyNames::CLI
  attr_accessor :input, :girl_array, :boy_array

  def initialize
    @input = input
    @girl_array = []
    @boy_array = []
  end

  def call
    puts "Would you like the top 10 girl names or top 10 boy names?"
    puts "(Type 'girls' or 'boys' and press enter.)"
    input = gets.chomp
    errorMsg = "Sorry, you need to choose a gender. Please try again..."

    if input == "girls" || input == "Girls"
      girl_names
      call_girl_table
    elsif input == "boys" || input == "Boys"
      boy_names
      call_boy_table
    else
      puts errorMsg
      call
    end
  end

  def girl_names
    html = open("https://www.ssa.gov/oact/babynames/")
    doc = Nokogiri::HTML(html)

    doc.css("td:nth-child(3)").each(){|name|
      @girl_array << name.text if !@girl_array.include?(name.text)
    }
  end

  def boy_names
    html = open("https://www.ssa.gov/oact/babynames/")
    doc = Nokogiri::HTML(html)

    doc.css("td:nth-child(2)").each(){|name|
      @boy_array << name.text if !@boy_array.include?(name.text)
    }
  end


  def scraper
    html = open("https://www.ssa.gov/oact/babynames/")
    doc = Nokogiri::HTML(html)

    @rank_head = doc.css(".c-table th:nth-child(1)").text.upcase
    @boys_head = doc.css(".c-table th:nth-child(2)").text.upcase + "S"
    @girls_head = doc.css(".c-table th:nth-child(3)").text.upcase + "S"
  end

  def call_girl_table
    scraper
    count = 1
    puts "<<{}--[#{@rank_head}]-[#{@girls_head}]--{}>>"
    @girl_array.each(){|name|
      puts "   >>  [#{count}]:" + "     #{name}" unless count == 10
      count += 1
    }
    puts "   >>  [#{count-1}]:" + "    #{@girl_array[9]}"
    puts "<<{}---------END-----------{}>>"

    boys_this_time?
  end

  def call_boy_table
    scraper
    count = 1
    puts "<<{}--[#{@rank_head}]-[#{@boys_head}]--{}>>"
    @boy_array.each(){|name|
      puts "   >>  [#{count}]:" + "     #{name}" unless count == 10
      count += 1
    }
    puts "   >>  [#{count-1}]:" + "    #{@boy_array[9]}"
    puts "<<{}---------END-----------{}>>"

    girls_this_time?
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
      boy_names
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

  def boys_this_time?
  puts " "
  puts "/////////////////////////////////"
  puts "Would you like to know boy names?"
  puts "(type 'yes' or 'no')"
  puts "/////////////////////////////////"
  answer = gets.chomp

    if answer == "no" || answer == "No" || answer == "exit"
      puts "Goodbye! :)"
    elsif answer == "yes" || answer == "Yes"
      puts " "
      boy_names
      call_boy_table
    elsif answer != "yes" || answer != "Yes" || answer != "no" || answer != "No"
      puts " "
      puts "Sorry, that is an invalid response."
      puts "Please type 'yes' or 'no'."
      puts " "
      puts "--!! HELP !!--"
      puts "If you're trying to exit, please type 'exit'."
      boys_this_time?
    end
  end
end
#Testing
