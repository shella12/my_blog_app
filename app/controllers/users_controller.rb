class UsersController < ApplicationController
  before_action :current_user
  def index
    @users = User.all
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end
