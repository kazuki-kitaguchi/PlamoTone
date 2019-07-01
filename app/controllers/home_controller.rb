class HomeController < ApplicationController
  before_action :set_color,only: :index
  PER = 10
  def index
    @colors = Color.page(params[:page]).per(PER)
    @makers = Maker.page(params[:page]).per(PER).joins(:colors).select(:color_name,:maker_name)
  end

  def search
    @colors = @search.result.page(params[:page]).per(PER)
    @makers = @colors.joins(:maker).select(:color_name,:maker_name)
    if @colors.total_count == 0
      @message = '検索した結果、見つかりませんでした。'
    else
      @message =  nil
    end
  end

  private
    def set_color
      if params[:sel_id] != nil
        @color = Color.find(params[:sel_id])
        @sel_color_id = "#sel-#{@color.id}"
        @sel_color_code = "##{@color.color_code}"
      end
    end
end
