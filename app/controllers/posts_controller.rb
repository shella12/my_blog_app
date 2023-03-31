class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:comments).where(user_id: params[:user_id])
    @current_user = User.first
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @current_user = User.first
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user: User.first, title: params[:title], text: params[:text], comments_counter: 0,
                     likes_counter: 0)
    if @post.save
      redirect_to user_path(params[:user_id])
    else
      puts @post.errors.full_messages
    end
  end
end
