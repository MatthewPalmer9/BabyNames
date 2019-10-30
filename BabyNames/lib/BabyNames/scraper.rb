class Scraper
  attr_accessor :rank_head, :boys_head, :girls_head

  def get_headers
    html = open("https://www.ssa.gov/oact/babynames/")
    doc = Nokogiri::HTML(html)
    @rank_head = doc.css(".c-table th:nth-child(1)").text.upcase
    @boys_head = doc.css(".c-table th:nth-child(2)").text.upcase + "S"
    @girls_head = doc.css(".c-table th:nth-child(3)").text.upcase + "S"
  end

  def girl_names 
    html = open("https://www.ssa.gov/oact/babynames/")
    doc = Nokogiri::HTML(html)

    doc.css("td:nth-child(3)").each(){|name|
       GirlNames.new(name.text)
    }
  end

  def boy_names
    html = open("https://www.ssa.gov/oact/babynames/")
    doc = Nokogiri::HTML(html)

    doc.css("td:nth-child(2)").each(){|name|
      BoyNames.new(name.text)
    }
  end
end
