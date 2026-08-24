class Prestamo < ApplicationRecord
  belongs_to :usuario
  belongs_to :recurso
  belongs_to :autorizador, class_name: "Usuario", optional: true

  enum :estado, { activo: 0, terminado: 1 }

  before_create :establecer_fechas

  def finalizar!
    update(estado: :terminado, fecha_termino: Time.current)
  end

  private

  def establecer_fechas
    self.fecha_inicio ||= Time.current
    self.estado ||= :activo
  end
end