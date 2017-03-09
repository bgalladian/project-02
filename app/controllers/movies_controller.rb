class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # Good implementation of user authentication

  def index
    # Good job using one view with added search functionality
  @movies = Movie.all
  if params[:search]
    @movies = Movie.search(params[:search]).order("title")
  else
    @movies = Movie.all.order("title")
  end
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
    @movie = current_user.movies.create!(movie_params)
    redirect_to movies_path
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to movie_path
    # While rails does allow you to simply specify `movie_path` here because the
    # variable `@movie` matches the path name, I would suggest always being specific
    # in any path helpers that are not index routes (i.e. `movies_path` is fine but
    # for a specific movie, `movie_path(@movie)` is slightly more intentional and readable)
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.user == current_user
    @movie.destroy
  end
    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :director, :summary, :written_by, :poster_url, :release_date).merge(user: current_user)
  end
end
