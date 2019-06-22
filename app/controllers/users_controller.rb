class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    if user_signed_in? && current_user.admin == true
      @users = User.all
    else
      redirect_to home_index_path
    end
  end

  def show
    @user = User.find(params[:id])
    @likes = Like.joins(:color).where(user_id: params[:id]).select(:color_id,:color_name,:color_code)
  end
end
