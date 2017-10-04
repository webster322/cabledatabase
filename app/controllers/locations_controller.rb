class LocationsController < ApplicationController
  def view
    @locations = Location.all
  end

  def create
    @location = Location.new
  end

  def delete
  end
end
