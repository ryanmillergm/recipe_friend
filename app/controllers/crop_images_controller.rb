class CropImagesController < ApplicationController
  before_action :set_user, only: [:new, :show, :create, :edit, :update, :destroy]

  def new
  end

  def show
  end

  def create
    if params[:coords_x].present? &&
      params[:coords_y].present? &&
      params[:coords_w].present? &&
      params[:coords_h].present?

      x = params[:coords_x]
      y = params[:coords_y]
      w = params[:coords_w]
      h = params[:coords_h]

      if params[:background].present?

        @user.update(background_coords: "#{w}x#{h}+#{x}+#{y}")
        @user.save

      elsif @user.avatar.attached?

        @user.update(avatar_coords: "#{w}x#{h}+#{x}+#{y}")
        @user.save

      else
        flash[:notice] = "You must submit cropping dimensions"
        render :new
      end
      flash[:success] = "Successfully Saved"
      redirect_to dashboard_my_profile_path(@user.id)
    end
  end

  def edit
  end

  private

  def set_user
    @user = current_user
  end
end
