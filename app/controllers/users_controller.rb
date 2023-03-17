class UsersController < ApplicationController
  def index
    @users = User.all
    @username = 'ayesha'
  end

  def show; end
end
