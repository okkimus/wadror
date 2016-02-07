class Beer < ActiveRecord::Base
  include Average
  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, -> { uniq }, through: :ratings, source: :user

  validates :name, presence: true

  def to_s
    "#{name}, #{brewery.name}"
  end
end

#Rating.where beer_id:self.id
