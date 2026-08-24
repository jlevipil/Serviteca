class CreateRecursos < ActiveRecord::Migration[8.1]
  def change
    create_table :recursos do |t|
      t.string :codigo
      t.string :nombre
      t.string :tipo
      t.integer :cantidad
      t.string :ubicacion
      t.text :observaciones
      t.date :fecha_vencimiento

      t.timestamps
    end
  end
end
