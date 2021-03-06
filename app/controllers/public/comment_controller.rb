class Public::CommentController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_member.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to public_post_path(post)
  end
  
  def destroy
    post = Post.find(params[:post_id])
    Comment.find(params[:id]).destroy
    redirect_to public_post_path(post)
  end

private

def comment_params
  params.require(:comment).permit(:comment, :member_id, :machine_id, :post_id)
end
end
