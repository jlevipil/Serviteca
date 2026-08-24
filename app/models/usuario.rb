class Usuario < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  enum :role, { estudiante: 0, encargado: 1, admin: 2 }

  has_many :prestamos
  has_many :recursos, through: :prestamos

  before_validation :asignar_rol_por_defecto, on: :create

  private

  def asignar_rol_por_defecto
    self.role ||= :estudiante
  end
end