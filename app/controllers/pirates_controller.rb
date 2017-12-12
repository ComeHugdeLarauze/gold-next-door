class PiratesController < ApplicationController
  def show
    @pirate = Pirate.find(params[:id])
  end
end
