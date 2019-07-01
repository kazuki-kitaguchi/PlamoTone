class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_color,only: :show
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

  private

  def set_color
    if params[:sel_id] != nil
        @like = Like.joins(:color).where(user_id: current_user.id).where(color_id: params[:sel_id]).select("likes.*,colors.*").first
        @sel_color_id = "#sel-#{@like.color_id}"
        @sel_color_code = "##{@like.color_code}"
      end
  end
end
