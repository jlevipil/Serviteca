class UsuariosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :requerir_admin!
  before_action :set_usuario, only: [:edit, :update, :destroy]

  def index
    @usuarios = Usuario.all.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @usuario.update(usuario_params)
      redirect_to usuarios_path, notice: "Usuario actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @usuario == current_usuario
      redirect_to usuarios_path, alert: "No puedes eliminar tu propia cuenta de administrador."
    else
      @usuario.destroy
      redirect_to usuarios_path, notice: "Usuario eliminado con éxito."
    end
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:role)
  end

  def requerir_admin!
    unless current_usuario.admin?
      redirect_to root_path, alert: "Acceso denegado."
    end
  end
end