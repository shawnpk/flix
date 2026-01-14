class Movie < ApplicationRecord
  scope :released, -> { where("released_on > ?", Time.current).order(released_on: :desc) }

  def flop?
    total_gross.blank? || total_gross < 225_000_000
  end
end
