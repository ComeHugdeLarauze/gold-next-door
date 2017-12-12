class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception


  before_action :authenticate_pirate!
  before_action :configure_permitted_parameters, if: :devise_controller?

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :pirate_not_authorized

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo])
  end

  def pirate_not_authorized
    flash[:alert] = "Haha tu pensais avoir accès...!"
    redirect_to(tresors_path)
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def pundit_user
    current_pirate
  end
end
