class Public::PostsController < ApplicationController
  def new
  end

  def index
    if current_member
      @posts = current_member.posts.all
    else
      @posts = Post.all
    end
  end

  def show
  end
end
