class WiresController < ApplicationController
  def delete
  end

  def new
    @cable = Cable.new
    @locations = Location.all
  end

  def view
    @cables = Cable.all
  end

  def create
    @cable = Cable.new(locations_params)
    if @cable.save
      flash[:notice] = "Kabel utworzony pomyślnie"
      redirect_to wires_view_path
    end
  end

  private

  def locations_params
    params.require(:cable).permit(:name, :from, :to)
  end
end
