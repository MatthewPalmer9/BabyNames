class BabyNames::CLI
  attr_accessor :scraper

  def call
    Scraper.new.boy_names
    Scraper.new.girl_names
    puts "Would you like the top 10 girl names or top 10 boy names?"
    puts "(Type 'girls' or 'boys' and press enter.)"
    input = gets.chomp.downcase
    errorMsg = "Sorry, you need to choose a gender. Please try again..."

    @scraper = Scraper.new
    @scraper.get_headers

    if input == "girls"
      call_girl_table
    elsif input == "boys"
      call_boy_table
    else
      puts errorMsg
      call
    end
  end

  def call_girl_table
    count = 1
    puts "<<{}--[#{@scraper.rank_head}]-[#{@scraper.girls_head}]--{}>>"
    GirlNames.all.each(){|girl|
      puts "   >>  [#{count}]:" + "     #{girl.name}" unless count == 10
      count += 1
    }
    puts "   >>  [#{count-1}]:" + "    #{GirlNames.all.last.name}"
    puts "<<{}---------END-----------{}>>"
    puts " "
    puts "** If you would like a random girl name, type 'random' **"
    boys_this_time?
  end

  def call_boy_table
    count = 1
    puts "<<{}--[#{@scraper.rank_head}]-[#{@scraper.boys_head}]--{}>>"
    BoyNames.all.each(){|boy|
      puts "   >>  [#{count}]:" + "     #{boy.name}" unless count == 10
      count += 1
    }
    puts "   >>  [#{count-1}]:" + "    #{BoyNames.all.last.name}"
    puts "<<{}---------END-----------{}>>"
    puts " "
    puts "** If you would like a random boy name, type 'random' **"

    girls_this_time?
  end

  def girls_this_time?
    puts " "
    puts "//////////////////////////////////"
    puts "Would you like to know girl names?"
    puts "(type 'yes' or 'no')"
    puts "//////////////////////////////////"
    answer = gets.chomp.downcase

    if answer == "no" || answer == "exit"
      puts "Goodbye! :)"
    elsif answer == "yes"
      puts " "
      call_girl_table
    elsif answer == "random"
      randomize_boy
    elsif answer != "yes" || answer != "no"
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
    puts "//////////////////////////////////"
    puts "Would you like to know boy names?"
    puts "(type 'yes' or 'no')"
    puts "//////////////////////////////////"
    answer = gets.chomp.downcase

    if answer == "no" || answer == "exit"
      puts "Goodbye! :)"
    elsif answer == "yes"
      puts " "
      call_boy_table
    elsif answer == 'random'
      randomize_girl
    elsif answer != "yes" || answer != "no"
      puts " "
      puts "Sorry, that is an invalid response."
      puts "Please type 'yes' or 'no'."
      puts " "
      puts "--!! HELP !!--"
      puts "If you're trying to exit, please type 'exit'."
      boys_this_time?
    end
  end

  def randomize_girl
    puts " "
    puts GirlNames.all.sample.name
    puts " "
    boys_this_time?
  end

  def randomize_boy
    puts " "
    puts BoyNames.all.sample.name
    puts " "
    girls_this_time?
  end

end
