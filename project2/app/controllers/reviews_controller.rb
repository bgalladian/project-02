class ReviewsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = Review.all
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params)
    redirect_to movie_review_path(@movie, @review)
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to movie_review_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to movies_path
  end

  private
  def review_params
    params.require(:review).permit(:author, :content, :rating)
  end
end
