require 'open-uri'
require 'nokogiri'
require 'pry'

class BabyNames::CLI
  attr_accessor :male_names, :female_names, :rank_nums, :input

  def initialize
    @male_names = {}
    @female_names = {}
    @rank_nums = {}
    @input = input
  end

  def call
    puts "Would you like the top girl names or top boy names? (Type 'girls' or 'boys' and press enter.)"
    input = gets.chomp
    errorMsg = "Sorry, you need to choose a gender. Please try again...\n"
    while input != "girls" || input != "boys"
      if input == "girls" || input == "Girls"
        call_table
      elsif input == "boys" || input == "Boys"
        call_table
      else
        puts errorMsg
        call
      end
    end
  end

  def scrape
    html = open("https://www.ssa.gov/oact/babynames/")
    doc = Nokogiri::HTML(html)

    @rank_head = doc.css(".c-table th:nth-child(1)").text.upcase
    @boys_head = doc.css(".c-table th:nth-child(2)").text.upcase + "S"
    @girls_head = doc.css(".c-table th:nth-child(3)").text.upcase + "S"
  end

  def call_table
    scrape
    puts "<<{}--[#{@rank_head}]---[#{@boys_head}]---[#{@girls_head}]--{}>>"
    binding.pry
  end
end
