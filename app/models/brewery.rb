class Brewery < ActiveRecord::Base
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2016
    puts "changed year to #{year}"
  end

  def average_rating
    rates = self.ratings
    l = rates.map {|rate| rate.score}
    sum = l.inject(0) {|sum, x| sum + x}
    sum.to_f / l.count
  end

end
