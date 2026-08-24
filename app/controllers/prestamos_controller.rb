class PrestamosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :verificar_encargado_o_admin!, only: [:create, :finalizar]

  def index
    if current_usuario.estudiante?
      @prestamos = current_usuario.prestamos.activo.includes(:recurso, :autorizador)
    else
      @prestamos = Prestamo.activo.includes(:usuario, :recurso, :autorizador)
    end
  end

  def new
    if current_usuario.estudiante?
      redirect_to recursos_path(query: params[:query], tipo: params[:tipo]), alert: "Atención: Los préstamos solo pueden ser registrados por el encargado del taller."
      return
    end

    @recurso = Recurso.find(params[:recurso_id])
    @prestamo = Prestamo.new
  end

  def create
    @recurso = Recurso.find(params[:prestamo][:recurso_id])
    usuario_destino = Usuario.find_by(email: params[:prestamo][:email_usuario])

    if usuario_destino.nil?
      redirect_to new_prestamo_path(recurso_id: @recurso.id), alert: "Usuario no encontrado con ese correo."
      return
    end

    if @recurso.cantidad.to_i <= 0
      redirect_to recursos_path, alert: "No hay stock disponible de este recurso."
      return
    end

    @prestamo = Prestamo.new(
      recurso: @recurso,
      usuario: usuario_destino,
      autorizador: current_usuario
    )

    if @prestamo.save
      @recurso.decrement!(:cantidad)
      redirect_to prestamos_path, notice: "Préstamo registrado exitosamente a #{usuario_destino.email}."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def finalizar
    @prestamo = Prestamo.find(params[:id])
    @prestamo.finalizar!
    @prestamo.recurso.increment!(:cantidad)

    redirect_to prestamos_path, notice: "Préstamo terminado y stock devuelto."
  end
end