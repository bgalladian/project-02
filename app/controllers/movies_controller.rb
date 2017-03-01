class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
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
