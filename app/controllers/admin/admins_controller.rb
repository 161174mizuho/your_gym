class Admin::AdminsController < ApplicationController
  def edit
    @admin = Admin.find(params[:id])
  end

  def update
  end

  def show
    @admin = Admin.find(params[:id])
  end

  private
  def admin_params
    params.require(:admin).permit(:gym_name, :gym_image, :email)
  end
end
