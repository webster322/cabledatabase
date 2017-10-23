class WiresController < ApplicationController
  def delete
    @cable = Cable.find(params[:id])
    if Fibre.exists?(:name => @cable.name)
      flash[:danger] = "Błąd! W bazie istnieje włókno wskazujące na ten kabel!"
      redirect_to wires_view_path
    else
      @cable.destroy
      flash[:success] = "Kabel usunięty pomyślnie"
      redirect_to wires_view_path
    end
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
    unless Cable.exists?(:name => @cable.name)
      if @cable.save
        flash[:success] = "Kabel utworzony pomyślnie"
        redirect_to wires_new_path
      else
        flash[:danger] = "Błąd!"
        redirect_to wires_new_path
      end
    else
      flash[:danger] = "Błąd! Kabel istnieje!"
      redirect_to wires_new_path
    end
  end

  private

  def locations_params
    params.require(:cable).permit(:name, :from, :to)
  end
end
