class FibresController < ApplicationController
  def index
    @fibres = Fibre.all
  end

  def new
    @fibre = Fibre.new
  end

  def create
  end

  def delete
  end
end
