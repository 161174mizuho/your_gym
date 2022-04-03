class Public::PostsController < ApplicationController
  def new
    @machine = params[:machine_id]
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      redirect_to public_posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:member_id,:machine_id, :post_image, :sentence)
  end
end
