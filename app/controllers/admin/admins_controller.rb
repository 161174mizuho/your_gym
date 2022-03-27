class Admin::AdminsController < Admin::AdminApplicationController

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    admin = Admin.find(params[:id])
    admin.update(admin_params)
    redirect_to admin_path(admin)
  end

  def show
    @admin = Admin.find(params[:id])
  end

  private
  def admin_params
    params.require(:admin).permit(:gym_name, :gym_image, :email)
  end
end
