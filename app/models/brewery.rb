class Brewery < ActiveRecord::Base
  include Average
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :name, presence: true
  validate :this_year_or_earlier
  validates :year, numericality: { greater_than_or_equal_to: 1042, only_integer: true } 

  def this_year_or_earlier
    if year > Time.now.year
      errors.add(:year, "can't be in the future")
    end
  end

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2016
    puts "changed year to #{year}"
  end

end
