require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative "BabyNames/version"
require_relative "BabyNames/cli"
require_relative "BabyNames/boy_names"
require_relative "BabyNames/girl_names"
require_relative "BabyNames/scraper"

module BabyNames
  class Error < StandardError; end
  # Your code goes here...
end
