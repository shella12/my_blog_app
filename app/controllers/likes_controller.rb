class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    puts "create Like"
    @post = Post.find(params[:post])
    @like = Like.new(user: current_user, post: @post)
      if @like.save
      puts "saved"
      redirect_to user_posts_path(params[:current_user])
    else
      puts @like.errors.full_messages
    end
  end
end
