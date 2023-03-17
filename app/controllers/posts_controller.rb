class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    # @postId = Post.find(params[:id])
  end
end
