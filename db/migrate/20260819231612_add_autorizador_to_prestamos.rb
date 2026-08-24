class AddAutorizadorToPrestamos < ActiveRecord::Migration[7.1]
  def change
    add_reference :prestamos, :autorizador, foreign_key: { to_table: :usuarios }, null: true
  end
end