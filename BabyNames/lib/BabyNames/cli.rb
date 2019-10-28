require 'open-uri'
require 'nokogiri'

class BabyNames::CLI
  attr_accessor :male_names, :female_names, :rank

  def initialize
    @male_names = male_names
    @female_names = female_names
    @rank = rank 
  end
end
