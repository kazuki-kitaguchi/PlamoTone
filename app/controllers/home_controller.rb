class HomeController < ApplicationController
  def index
    @colors = Color.page(params[:page])
    view
  end

  def search
  end
  
  private
  def view
        @left_chart = params[:param_l]
        @right_chart = params[:param_r]
    end
end
