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
    puts "Would you like the top girl names or top boy names? (Type 'girl' or 'boy' and press enter.)"
    input = gets.chomp
    errorMsg = "Sorry, you need to choose a gender. Please type 'girls' or 'boyss' and press enter."

    if input = "girls" || "Girls"
      call_table
    elsif input = "boys" || "Boys"
      call_table
    else
      puts errorMsg
      call
    end
  end

  def scrape
    html = open("https://www.ssa.gov/oact/babynames/")
    doc = Nokogiri::HTML(html)

    @rank_head = doc.css(".c-table th:nth-child(1)").text
    @boys_head = doc.css(".c-table th:nth-child(2)").text.upcase + "s"
    @girls_head = doc.css(".c-table th:nth-child(3)").text + "s"
  end

  def call_table
    scrape
    puts "<<{}--[#{@rank_head}]---[#{@boys_head}]---[#{@girls_head}]--{}>>"
    binding.pry
  end
end
