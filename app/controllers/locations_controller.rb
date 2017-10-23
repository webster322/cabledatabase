class LocationsController < ApplicationController
  def index
    @locations = Location.order(:name)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(locations_params)
    unless Location.exists?(:name => @location.name)
      if @location.save
        flash[:success] = "Obiekt utworzony pomyślnie"
        redirect_to locations_new_path
      else
        flash[:danger] = "Błąd!"
        redirect_to locations_new_path
      end
    else
      flash[:danger] = "Błąd! Obiekt istnieje!"
      redirect_to locations_new_path
    end
  end

  def delete
    @location = Location.find(params[:id])
    if (Fibre.exists?(:location => @location.name)) && (Cable.exists?(:from => @location.name)) && (Cable.exists?(:to => @location.name))
      flash[:danger] = "Błąd! W bazie istnieje włókno lub kabel wskazujące na ten obiekt!"
      redirect_to locations_path
    else
      @location.destroy
      flash[:success] = "Obiekt usunięty pomyślnie"
      redirect_to locations_path
    end
  end

  private

  def locations_params
    params.require(:location).permit(:name)
  end
end
