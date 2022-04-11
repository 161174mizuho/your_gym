class Public::PostsController < ApplicationController
  def new
    @machine = Machine.find(params[:machine_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    @post.admin_id = Machine.find(params[:post][:machine_id]).admin_id
    if @post.save
      redirect_to public_posts_path
    else
      @machine = Machine.find(params[:post][:machine_id])
      render :new
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to public_posts_path
  end

  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  def post_index_machine
    @machine = Machine.find(params[:machine_id])
    @posts = Post.all(@machine)
  end  
  
  private

  def post_params
    params.require(:post).permit(:member_id, :machine_id, :post_image, :sentence)
  end
end
