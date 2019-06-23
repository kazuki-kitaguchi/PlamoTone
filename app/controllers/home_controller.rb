class HomeController < ApplicationController
  PER = 5
  def index
    @search = Color.ransack(params[:q])
    @colors = Color.page(params[:page]).per(PER)
    @makers = Maker.page(params[:page]).per(PER).joins(:colors).select(:color_name,:maker_name)
    view
  end

  def search
    @search = Color.ransack(params[:q])
    @colors = @search.result.page(params[:page]).per(PER)
    @makers = @colors.joins(:maker).select(:color_name,:maker_name)
    preview
  end
  
  private
    def view
      @left_chart = params[:param_l]
      @right_chart = params[:param_r]
    end
    def preview
      @left_chart = params[:q][:param_l]
      @right_chart = params[:q][:param_r]
    end
end
