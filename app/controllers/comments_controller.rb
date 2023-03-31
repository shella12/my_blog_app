class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    puts 'create comment'
    @post = Post.find(params[:post])
    @comment = Comment.new(user: @post.user, post: @post, text: params[:text])
    if @comment.save
      puts 'saved'
      redirect_to user_posts_path(params[:user_id])
    else
      puts @comment.errors.full_messages
    end
  end
end
