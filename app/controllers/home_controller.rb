class HomeController < ApplicationController
  def index
    @colors = Color.all
  end

  def search
  end
end
