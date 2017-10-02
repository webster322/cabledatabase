class HomeController < ApplicationController
  def index
  end

  def new
    @cable = Cable.new
  end

  def create_cable
    @cable = Cable.new
  end
end
