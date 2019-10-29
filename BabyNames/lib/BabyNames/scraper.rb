class Scraper < BabyNames::CLI

  def initialize
    html = open("https://www.ssa.gov/oact/babynames/")
    doc = Nokogiri::HTML(html)

    @rank_head = doc.css(".c-table th:nth-child(1)").text.upcase
    @boys_head = doc.css(".c-table th:nth-child(2)").text.upcase + "S"
    @girls_head = doc.css(".c-table th:nth-child(3)").text.upcase + "S"
  end

  def rank
    @rank_head
  end

  def male_names
    @boys_head
  end

  def female_names
    @girls_head
  end

end
