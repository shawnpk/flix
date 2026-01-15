module MoviesHelper
  def total_gross(movie)
    if movie.flop?
      "Flop!"
    else
      number_to_currency(movie.total_gross)
    end
  end

  def year_of(movie)
    movie.released_on.year
  end

  def average_stars(movie)
    if movie.average_stars.zero?
      tag.strong("No reviews")
    else
      pluralize(number_with_precision(movie.average_stars, precision: 1), "star")
    end
  end
end
