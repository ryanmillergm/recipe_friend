class CommentsController < ApplicationController
  before_action :find_commentable, only: :create

  def new
    @comment = Comment.new
  end

  def create
    @comment.comments.build(comment_params)
    @comment.save
    @new_comment = @comment.comments.last
    @new_comment.update(content: @new_comment.content.strip)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
    @comment.update(content: params[:comment][:content].strip)
    redirect_to recipe_path(@recipe)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :rating)
  end

  def find_commentable
    if params[:comment][:content] == ""
      no_content

    elsif params[:comment_id]
      @recipe = Recipe.find( params[:comment][:recipe_id])
      @comment = Comment.find_by_id(params[:comment_id])
    elsif params[:recipe_id]
      @recipe = Recipe.find_by_id(params[:recipe_id])
      @comment = Recipe.find_by_id(params[:recipe_id])
    end
  end

  def no_content
    if params[:comment_id]
      @recipe = Recipe.find( params[:comment][:recipe_id])
      flash[:error] = "You're reply cannot be blank"
      redirect_to recipe_path(@recipe)
    elsif params[:recipe_id]
      @recipe = Recipe.find_by_id(params[:recipe_id])
      flash[:error] = "You're reply cannot be blank"
      redirect_to recipe_path(@recipe)
    end
  end
end
