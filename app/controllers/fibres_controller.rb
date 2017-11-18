class FibresController < ApplicationController
  before_action :authenticate_user!
  def index
    @fibres = Fibre.paginate(:page => params[:page], :per_page => 10)
  end

  def search
    if (params.has_key?(:name)) && (params.has_key?(:location))
      fibre = Fibre.where(name: params[:name], location: params[:location])
      @fibres = fibre.paginate(:page => params[:page], :per_page => 10)
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
    if @fibre.save
      flash[:success] = t "fiber_created"
      redirect_to fibres_new_path
    else
      flash[:danger] = t "error"
      redirect_to fibres_new_path
    end
  end

  def delete
    @fibre = Fibre.find(params[:id])
    @fibre.destroy
    flash[:success] = t "fiber_deleted"
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
    flash[:success] = t "fiber_updated"
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
