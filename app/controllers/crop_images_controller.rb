class CropImagesController < ApplicationController
  def new
    @user = current_user
  end

  def create
    @user = current_user
    if @user.avatar.attached? &&
        params[:coords_x].present? &&
        params[:coords_y].present? &&
        params[:coords_w].present? &&
        params[:coords_h].present?

        x = params[:coords_x]
        y = params[:coords_y]
        w = params[:coords_w]
        h = params[:coords_h]

      @user.update(avatar_coords: "#{w}x#{h}+#{x}+#{y}")
      @user.save

      flash[:success] = "Successfully Saved"
      redirect_to dashboard_my_profile_path(@user.id)
    else
      flash[:notice] = "You must submit cropping dimensions"
      render :new
    end
  end
end
