class LocationsController < ApplicationController
  def index
    loc = Location.order(:name)
    @locations = loc.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(locations_params)
    unless Location.exists?(:name => @location.name)
      if @location.save
        flash[:success] = t "location_created"
        redirect_to locations_new_path
      else
        flash[:danger] = t "error"
        redirect_to locations_new_path
      end
    else
      flash[:danger] = t "location_error"
      redirect_to locations_new_path
    end
  end

  def delete
    @location = Location.find(params[:id])
    if (Fibre.exists?(:location => @location.name)) && (Cable.exists?(:from => @location.name)) && (Cable.exists?(:to => @location.name))
      flash[:danger] = t "location_used"
      redirect_to locations_path
    else
      @location.destroy
      flash[:success] = t "location_deleted"
      redirect_to locations_path
    end
  end

  private

  def locations_params
    params.require(:location).permit(:name)
  end
end
