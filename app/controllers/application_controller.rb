class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    @search = Color.ransack(params[:q])
  end
end
