class Movie < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  RATINGS = %w[G PG PG-13 R NC-17]

  validates :title, :released_on, :duration, presence: true
  validates :description, length: { minimum: 25 }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, inclusion: { in: RATINGS }
  validates :image_file_name, format: {
    with: /\A\w+\.(jpg|png)\z/i,
    message: "must be a JPG or PNG image"
  }

  scope :released, -> { where("released_on > ?", Time.current).order(released_on: :desc) }

  def flop?
    unless reviews.count >= 50 && average_stars >= 4
      (total_gross.blank? || total_gross < 225_000_000)
    end
  end

  def average_stars
    reviews.average(:stars) || 0.0
  end
end
