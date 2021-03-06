class Public::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
    @posts = @member.posts
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    member.update(member_params)
    redirect_to public_member_path(member)
  end

  private
  def member_params
    params.require(:member).permit(:name, :icon, :email)
  end

end
