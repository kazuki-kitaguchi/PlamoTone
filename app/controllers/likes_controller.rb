class LikesController < ApplicationController
  before_action :set_color, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(color_id: params[:color_id])
    @colors = Color.all
  end

  def destroy
    like = current_user.likes.find_by(color_id: params[:color_id])
    like.destroy
    @colors = Color.all
    if @flag == "true"
        respond_to do |format|
          format.html { redirect_to user_path(current_user.id) }
        end
    end
  end

  private

  def set_color
    @color = Color.find(params[:color_id])
    @flag = params[:flag_mycolor]
    @color_id = "#like-of-#{@color.id}"
  end
end
