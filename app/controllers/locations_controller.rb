class LocationsController < ApplicationController
  def index
    @locations = Location.order(:name)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(locations_params)
    if @location.save
      flash[:notice] = "Obiekt utworzony pomyślnie"
      redirect_to locations_path
    end
  end

  def delete
  end

  private

  def locations_params
    params.require(:location).permit(:name)
  end
end
