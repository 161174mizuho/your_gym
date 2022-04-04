class Public::PostsController < ApplicationController
  def new
    @machine = Machine.find(params[:machine_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      redirect_to public_posts_path
    else
      @machine = Machine.find(params[:post][:machine_id])
      render :new
    end
  end

  def index
    if current_member
      @posts = Post.where(member_id: current_member.id).includes(:member).order("created_at DESC")
    else
      @posts = Post.all
    end
  end

  private

  def post_params
    params.require(:post).permit(:member_id, :machine_id, :post_image, :sentence)
  end
end
