class LikesController < ApplicationController
  before_action :set_color, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(color_id: params[:color_id])
    # @likes = Like.where(color_id: params[:color_id])
    @colors = Color.all
    # respond_to do |format|
    #   format.html { redirect_to home_index_path }
    # end
  end

  def destroy
    like = current_user.likes.find_by(color_id: params[:color_id])
    like.destroy
    # @likes = Like.where(color_id: params[:color_id])
    @colors = Color.all
    # respond_to do |format|
    #   format.html { redirect_to home_index_path }
    # end
  end

  private

  def set_color
    @color = Color.find(params[:color_id])
    @color_id = "#like-of-#{@color.id}"
  end
end
