class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    @movie.save

    redirect_to @movie
  end

  def update
    @movie = Movie.find(params[:id])

    @movie.update(movie_params)

    redirect_to @movie
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy

    redirect_to movies_path, status: :see_other
  end

  def movie_params
    params.expect(movie: [ :title, :description, :rating, :released_on, :total_gross ])
  end
end
