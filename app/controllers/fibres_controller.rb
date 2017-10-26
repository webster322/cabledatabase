class FibresController < ApplicationController
  def index
    @fibres = Fibre.all
  end

  def search
    if (params.has_key?(:name)) && (params.has_key?(:location))
      @fibres = Fibre.where(name: params[:name], location: params[:location])
    else
      redirect_to fibres_path
    end
  end

  def new
    @fibre = Fibre.new
    @locations = Location.all
    @wires = Cable.all
  end

  def create
    @fibre = Fibre.new(user_params)
    if (Fibre.exists?(:number => @fibre.number)) && (Fibre.exists?(:name => @fibre.name)) && (Fibre.exists?(:location => @fibre.location))
      flash[:danger] = "Błąd! Włókno istnieje!"
      redirect_to fibres_new_path
    else
      if @fibre.save
        flash[:success] = "Włókno utworzone pomyślnie"
        redirect_to fibres_new_path
      else
        flash[:danger] = "Błąd!"
        redirect_to fibres_new_path
      end
    end
  end

  def delete
    @fibre = Fibre.find(params[:id])
    @fibre.destroy
    flash[:success] = "Włókno usunięto pomyślnie"
    redirect_to fibres_path
  end

  def edit
    if(params.has_key?(:id))
      @fibre = Fibre.find(params[:id])
      @locations = Location.all
      @wires = Cable.all
    else
      redirect_to fibres_path
    end
  end

  def update
    @fibre = Fibre.find(params[:fibre][:id])
    @fibre.update(user_params)
    flash[:success] = "Włókno zaktualizowane pomyślnie"
    redirect_to fibres_path
  end

  def show
    redirect_to fibres_path
  end

  private

  def user_params
    params.require(:fibre).permit(:number, :name, :location, :shelf, :damage, :system, :cabinet_name, :room)
  end
end
