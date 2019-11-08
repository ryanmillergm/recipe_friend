class CommentsController < ApplicationController
  before_action :find_commentable, only: :create

  def new
    @comment = Comment.new
  end

  def create
    @comment.comments.build(comment_params)
    @comment.save
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

  def find_commentable
    if params[:comment][:content] == ""
      flash[:error] = "You're reply cannot be blank"
      redirect_to recipe_path(params[:recipe_id])
    elsif params[:comment_id]
      @recipe = Recipe.find( params[:comment][:recipe_id])
      @comment = Comment.find_by_id(params[:comment_id])
    elsif params[:recipe_id]
      @recipe = Recipe.find_by_id(params[:recipe_id])
      @comment = Recipe.find_by_id(params[:recipe_id])
    end
  end
end
