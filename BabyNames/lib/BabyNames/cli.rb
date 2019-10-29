require 'open-uri'
require 'nokogiri'

class BabyNames::CLI
  attr_accessor :input, :girl_array, :boy_array

  def initialize
    @input = input
    #@girl_array = []
    @boy_array = []
  end

  def call
    puts "Would you like the top 10 girl names or top 10 boy names?"
    puts "(Type 'girls' or 'boys' and press enter.)"
    input = gets.chomp
    errorMsg = "Sorry, you need to choose a gender. Please try again..."

    if input == "girls" || input == "Girls"
      girls = GirlNames.new
      girls.girl_names
      girls.call_girl_table
    elsif input == "boys" || input == "Boys"
      boys = BoyNames.new
      boys.boy_names
      boys.call_boy_table
    else
      puts errorMsg
      call
    end
  end
end
