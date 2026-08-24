class CreatePrestamos < ActiveRecord::Migration[8.1]
  def change
    create_table :prestamos do |t|
      t.references :usuario, null: false, foreign_key: true
      t.references :recurso, null: false, foreign_key: true
      t.datetime :fecha_prestamo

      t.timestamps
    end
  end
end
