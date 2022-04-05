class Public::CommentController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_member.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to public_posts_path
  end

private

def commnt_params
  params.require(:comment).permit(:comment, :member_id, :machine_id, :post_id)
end
end
