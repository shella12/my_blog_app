class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: params[:user_id])
    @current_user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
    @current_user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user: current_user, title: params[:title], text: params[:text], comments_counter: 0, likes_counter: 0,)
    if @post.save
      redirect_to user_path(params[:user_id])
    else
      puts @post.errors.full_messages
    end
  end

  def username(user_id)
    User.find(user_id).name
  end
  helper_method :username
end
