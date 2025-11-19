class Restaurant < ApplicationRecord
  CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]

  validates :category, presence: true, inclusion: { in: Restaurant::CATEGORY }
  validates :name, :address, presence: true

  has_many :reviews, dependent: :destroy

  def average
    @reviews = self.reviews
    @reviews_ratings = @reviews.map do |review|
      review.rating
    end
    return @reviews_ratings.then { |a| (a.sum.to_f / a.size).round(1) }
  end
end
