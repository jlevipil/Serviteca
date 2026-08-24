class RecursosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_recurso, only: [:edit, :update, :destroy]
  before_action :verificar_admin!, only: [:edit, :update, :destroy]

  def index
    @recursos = Recurso.all

    # Filtro por nombre o código
    if params[:query].present?
      query = "%#{params[:query].strip}%"
      @recursos = @recursos.where("nombre LIKE :q OR codigo LIKE :q", q: query)
    end
  
    # Filtro por tipo (HE, SE, IN, etc.)
    if params[:tipo].present?
      @recursos = @recursos.where(tipo: params[:tipo])
    end
  end

  def new
    @recurso = Recurso.new
  end

  def create
    @recurso = Recurso.new(recurso_params)
    if @recurso.save
      redirect_to recursos_path, notice: "Recurso ingresado exitosamente al inventario."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  # Acción para mostrar el formulario de edición
  def edit
  end

  # Acción para procesar los cambios realizados
  def update
    if @recurso.update(recurso_params)
      redirect_to recursos_path, notice: "Recurso actualizado con éxito."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Acción para eliminar el recurso
  def destroy
    @recurso.destroy
    redirect_to recursos_path, notice: "Recurso eliminado correctamente."
  end

  private

  def set_recurso
    @recurso = Recurso.find(params[:id])
  end

  def recurso_params
    params.require(:recurso).permit(:codigo, :nombre, :tipo, :cantidad, :ubicacion, :observaciones, :fecha_vencimiento)
  end

  def verificar_admin!
    unless current_usuario&.admin?
      redirect_to recursos_path, alert: "Solo los administradores pueden realizar esta acción."
    end
  end
end