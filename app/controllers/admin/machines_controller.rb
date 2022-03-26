class Admin::MachinesController < ApplicationController
  def new
    @machine = Machine.new
    @machines = current_admin.machines.page(params[:page])
  end

  def index
    @machine =Machine.new
    @machines = Machine.page(params[:page])
    render :new
  end

  def create
    # @machine = Machine.new
    @machines = Machine.all
    @machine = Machine.new(machine_params)
    @machine.admin_id = current_admin.id
    if @machine.save
      redirect_to new_machine_path
    else
      render :new
    end
  end

  def edit
    @machine =Machine.find(params[:id])
  end

  def update
    machine = Machine.find(params[:id])
    machine.update(machine_params)
    redirect_to machine_path(machine)
  end

  def show
    @machine =Machine.find(params[:id])
  end

  def destroy
    machine =Machine.find(params[:id])
    machine.destroy
    redirect_to new_machine_path
  end

private

def machine_params
  params.require(:machine).permit(:admin_id, :site_id, :machine_name, :machine_image, :explanation)
end
end