class UsersController < ApplicationController
  before_action :current_user
  def index
    @users = User.all
  end

  def show
    current_user
    @user = User.find(params[:id])
  end
end
