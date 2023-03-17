class UsersController < ApplicationController
  def index
    @users = User.all
    @username = 'ayesha'
  end

  def show
    # @user = User.find(params[:id]).name
  end
end
