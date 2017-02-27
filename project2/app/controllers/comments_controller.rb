class CommentsController < ApplicationController



  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @comment = @review.comments.create(comment_params)
    redirect_to movie_review_path(@movie, @review)
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to movie_review_path(@movie, @review)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to movie_review_path(@movie, @review)
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :comments)
  end
end
