class WiresController < ApplicationController
  def delete
    @cable = Cable.find(params[:id])
    @cable.destroy
    flash[:success] = "Kabel usunięty pomyślnie"
    redirect_to wires_view_path
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
    unless Cable.where(name: @cable.name)
      if @cable.save
        flash[:success] = "Kabel utworzony pomyślnie"
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
