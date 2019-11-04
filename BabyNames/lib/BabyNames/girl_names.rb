class GirlNames < BabyNames::CLI

  attr_accessor :name

  @@all = [].uniq

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

end
