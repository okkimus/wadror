class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  def average_rating
    rates = Rating.where beer_id:self.id
    l = rates.map {|rate| rate.score}
    sum = l.inject(0) {|sum, x| sum + x}
    sum.to_f / l.count
  end

  def to_s
    "#{name}, #{brewery.name}"
  end
end
