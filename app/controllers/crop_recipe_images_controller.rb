class CropRecipeImagesController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    if params[:coords_x].present? &&
      params[:coords_y].present? &&
      params[:coords_w].present? &&
      params[:coords_h].present?

      x = params[:coords_x]
      y = params[:coords_y]
      w = params[:coords_w]
      h = params[:coords_h]

      if @recipe.image.attached?

        @recipe.update(image_coords: "#{w}x#{h}+#{x}+#{y}")
        @recipe.save

      else
        flash[:notice] = "You must submit cropping dimensions"
        render :new
      end
      flash[:success] = "Successfully Saved"
      redirect_to dashboard_my_recipe_path(@recipe.id)
    end
  end

  private

  def set_user
    @user = current_user
  end
end
