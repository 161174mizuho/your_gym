class Public::GymsController < ApplicationController
  def index
    @gyms = Admin.page(params[:page])
  end

  def show
  end
end
