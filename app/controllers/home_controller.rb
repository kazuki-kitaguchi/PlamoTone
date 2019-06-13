class HomeController < ApplicationController
  def index
    @colors = Color.page(params[:page])
  end

  def search
  end
end
