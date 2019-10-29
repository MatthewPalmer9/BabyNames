class BoyNames < BabyNames::CLI
  attr_accessor

  def boy_names
    html = open("https://www.ssa.gov/oact/babynames/")
    doc = Nokogiri::HTML(html)

    doc.css("td:nth-child(2)").each(){|name|
      @boy_array << name.text if !@boy_array.include?(name.text)
    }
  end

  def call_boy_table
    count = 1
    puts "<<{}--[#{Scraper.new.rank}]-[#{Scraper.new.male_names}]--{}>>"
    @boy_array.each(){|name|
      puts "   >>  [#{count}]:" + "     #{name}" unless count == 10
      count += 1
    }
    puts "   >>  [#{count-1}]:" + "    #{@boy_array[9]}"
    puts "<<{}---------END-----------{}>>"

    GirlNames.new.girls_this_time?
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
