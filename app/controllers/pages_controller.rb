class PagesController < ApplicationController
  def home
    @total_herramientas = Recurso.where.not(tipo: ["IN", "EP"]).sum(:cantidad)
    @total_insumos      = Recurso.where(tipo: "IN").sum(:cantidad)
    @total_epp          = Recurso.where(tipo: "EP").sum(:cantidad)

    if current_usuario.estudiante?
      @prestamos_activos = current_usuario.prestamos.activo.count
    else
      @prestamos_activos = Prestamo.activo.count
    end
  end
end
