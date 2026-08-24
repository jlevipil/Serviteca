class ApplicationController < ActionController::Base
  before_action :authenticate_usuario!
  before_action :set_no_cache

  private

  def set_no_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name])
  end

  def verificar_admin!
    unless current_usuario&.admin?
      redirect_to recursos_path, alert: "Solo los administradores pueden realizar esta acción."
    end
  end
  
  def verificar_encargado_o_admin!
    unless current_usuario&.encargado? || current_usuario&.admin?
      redirect_to root_path, alert: "No tienes permisos para acceder a esta sección."
    end
  end
end