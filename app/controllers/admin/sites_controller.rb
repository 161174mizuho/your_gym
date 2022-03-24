class Admin::SitesController < ApplicationController
  def new
    @site = Site.new
    @sites = Site.page(params[:page])
  end

  def create
    @site = Site.new
    site = Site.new(site_params)
    site.admin_id = current_admin.id
    site.save
    redirect_to new_site_path
  end
  
  def destroy
    site = Site.find(params[:id])
    site.destroy
    redirect_to new_site_path
  end

private

def site_params
  params.require(:site).permit(:admin_id,:site_name)
end
end
