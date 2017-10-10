class FibresController < ApplicationController
  def index
    @fibres = Fibre.all
  end

  def new
    @fibre = Fibre.new
    @locations = Location.all
    @wires = Cable.all
  end

  def create
    @fibre = Fibre.new(locations_params)
    if @fibre.save
      flash[:success] = "Włókno utworzone pomyślnie"
      redirect_to fibres_new_path
    end
  end

  def delete
    @fibre = Fibre.find(params[:id])
    @fibre.destroy
    flash[:success] = "Włókno usunięto pomyślnie"
    redirect_to fibres_path
  end

  private

  def locations_params
    params.require(:fibre).permit(:number, :name, :location, :shelf, :damage, :system, :cabinet_name, :room)
  end
end
