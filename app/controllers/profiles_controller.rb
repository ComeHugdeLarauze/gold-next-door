class ProfilesController < ApplicationController
skip_after_action :verify_authorized

  def show
    @pirate = current_pirate
  end

  def edit
    @pirate = current_pirate
  end

  def update
    @pirate = current_pirate
    @pirate.update(pirate_params)
    redirect_to profile_path
  end

  def destroy
    @pirate = current_pirate
    @pirate.destroy
    redirect_to tresors_path
  end

  private
  def pirate_params
    params.require(:pirate).permit(:pseudo, :email, :photo)
  end
end
