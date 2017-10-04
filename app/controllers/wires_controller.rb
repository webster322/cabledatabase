class WiresController < ApplicationController
  def delete
  end

  def new
  end

  def view
    @cable = Cable.all
  end
end
