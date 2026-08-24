class Recurso < ApplicationRecord
  has_many :prestamos

  TIPOS = {
    "HE" => "Herramienta Eléctrica",
    "HM" => "Herramienta Manual",
    "EP" => "Equipo de Protección (EPP)",
    "MD" => "Instrumento de Medición",
    "DI" => "Equipo de Diagnóstico",
    "SE" => "Set / Juego",
    "IN" => "Insumo / Consumible"
  }.freeze

  def vencimiento
    if respond_to?(:fecha_vencimiento) && fecha_vencimiento.present?
      fecha_vencimiento.strftime("%d/%m/%Y")
    else
      "No aplica"
    end
  end
end
