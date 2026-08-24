# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_08_19_231612) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "prestamos", force: :cascade do |t|
    t.bigint "autorizador_id"
    t.datetime "created_at", null: false
    t.integer "estado", default: 0
    t.datetime "fecha_inicio"
    t.datetime "fecha_prestamo"
    t.datetime "fecha_termino"
    t.bigint "recurso_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "usuario_id", null: false
    t.index ["autorizador_id"], name: "index_prestamos_on_autorizador_id"
    t.index ["recurso_id"], name: "index_prestamos_on_recurso_id"
    t.index ["usuario_id"], name: "index_prestamos_on_usuario_id"
  end

  create_table "recursos", force: :cascade do |t|
    t.integer "cantidad"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.date "fecha_vencimiento"
    t.string "nombre"
    t.text "observaciones"
    t.string "tipo"
    t.string "ubicacion"
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role"
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "prestamos", "recursos"
  add_foreign_key "prestamos", "usuarios"
  add_foreign_key "prestamos", "usuarios", column: "autorizador_id"
end
