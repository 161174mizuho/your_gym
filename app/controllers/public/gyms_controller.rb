class Public::GymsController < ApplicationController
  def index
    @gyms = Admin.page(params[:page])
  end

  def show
    @gym = Admin.find(params[:id])
  end

  def machine_index
    @gym = Admin.find(params[:id])
    @machines = @gym.machines.all
  end
end
