class AddDetallesToPrestamos < ActiveRecord::Migration[7.1]
  def change
    add_column :prestamos, :fecha_inicio, :datetime
    add_column :prestamos, :fecha_termino, :datetime
    add_column :prestamos, :estado, :integer, default: 0
  end
end