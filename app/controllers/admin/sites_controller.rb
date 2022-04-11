class Admin::SitesController < Admin::AdminApplicationController
  before_action :authenticate_admin!
  def new
    @site = Site.new
    @sites = current_admin.sites.page(params[:page])
  end

  def index
    @site = Site.new
    @sites = Site.page(params[:page])
    render :new
  end

  def create
    @sites = Site.page(params[:page])
    @site = Site.new(site_params)
    @site.admin_id = current_admin.id
    if @site.save
      redirect_to new_site_path
    else
      render :new
    end
  end

  def destroy
    site = Site.find(params[:id])
    site.destroy
    redirect_to new_site_path
  end

private

def site_params
  params.require(:site).permit(:site_name)
end
end
