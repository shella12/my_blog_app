class UsersController < ApplicationController
  def index
    @books = Book.all
    @username = "ayesha"
  end
  def show
    # @user = User.find(params[:id]).name
  end
end
