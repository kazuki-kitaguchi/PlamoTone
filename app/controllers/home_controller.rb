class HomeController < ApplicationController
  def index
    @search = Color.ransack(params[:q])
    @colors = Color.page(params[:page])
    view
  end

  def search
    @search = Color.ransack(params[:q])
    @colors = @search.result.page(params[:page])
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
