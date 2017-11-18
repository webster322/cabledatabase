class WiresController < ApplicationController
  before_action :authenticate_user!
  def delete
    @cable = Cable.find(params[:id])
    if Fibre.exists?(:name => @cable.name)
      flash[:danger] = t "wires_used"
      redirect_to wires_view_path
    else
      @cable.destroy
      flash[:success] = t "wires_deleted"
      redirect_to wires_view_path
    end
  end

  def new
    @cable = Cable.new
    @locations = Location.all
  end

  def view
    @cables = Cable.paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @cable = Cable.new(locations_params)
    unless Cable.exists?(:name => @cable.name)
      if @cable.save
        flash[:success] = t "wires_created"
        redirect_to wires_new_path
      else
        flash[:danger] = t "error"
        redirect_to wires_new_path
      end
    else
      flash[:danger] = t "wires_error"
      redirect_to wires_new_path
    end
  end

  private

  def locations_params
    params.require(:cable).permit(:name, :from, :to)
  end
end
