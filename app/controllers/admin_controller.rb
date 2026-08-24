class AdminController < ApplicationController
  before_action :authenticate_usuario!
  before_action :requerir_admin!

  def index
    @prestamos_activos_count = Prestamo.activo.count
    @prestamos = Prestamo.includes(:usuario, :recurso, :autorizador).order(created_at: :desc)
  end

  private

  def requerir_admin!
    unless current_usuario.admin?
      redirect_to root_path, alert: "No tienes permisos para acceder al panel de administración."
    end
  end
end