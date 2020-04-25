# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_26_16_010436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bairros", force: :cascade do |t|
    t.string "zona"
    t.string "nome"
    t.integer "qtde_habitantes"
    t.integer "qtde_domicilios"
    t.integer "qtde_empresas"
    t.float "renda_media"
    t.bigint "cidade_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cidade_id"], name: "index_bairros_on_cidade_id"
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome"
    t.bigint "estado_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["estado_id"], name: "index_cidades_on_estado_id"
  end

  create_table "cidades_logradouros", id: false, force: :cascade do |t|
    t.bigint "cidade_id", null: false
    t.bigint "logradouro_id", null: false
    t.index ["cidade_id", "logradouro_id"], name: "index_cidades_logradouros_on_cidade_id_and_logradouro_id"
    t.index ["logradouro_id", "cidade_id"], name: "index_cidades_logradouros_on_logradouro_id_and_cidade_id"
  end

  create_table "coberturas", force: :cascade do |t|
    t.integer "vivo"
    t.integer "net"
    t.integer "oi"
    t.bigint "endereco_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["endereco_id"], name: "index_coberturas_on_endereco_id"
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "numero"
    t.string "complemento"
    t.bigint "logradouro_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logradouro_id"], name: "index_enderecos_on_logradouro_id"
  end

  create_table "estados", force: :cascade do |t|
    t.string "nome"
    t.string "uf"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locals", force: :cascade do |t|
    t.string "nome"
    t.string "atividade"
    t.integer "qtde_blocos"
    t.integer "qtde_lotes"
    t.bigint "endereco_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["endereco_id"], name: "index_locals_on_endereco_id"
  end

  create_table "logradouros", force: :cascade do |t|
    t.string "cep"
    t.string "nome"
    t.integer "inicio"
    t.integer "fim"
    t.string "lado"
    t.bigint "bairro_id", null: false
    t.bigint "cidade_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bairro_id"], name: "index_logradouros_on_bairro_id"
    t.index ["cidade_id"], name: "index_logradouros_on_cidade_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "email"
    t.bigint "endereco_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["endereco_id"], name: "index_enderecos_on_pessoa_id"
    t.index ["user_id"], name: "index_users_on_pessoa_id"
  end

  create_table "atendimentos", force: :cascade do |t|
    t.datetime "data"
    t.string "etapa"
    t.string "operadora"
    t.string "portfolio"
    t.bigint "endereco_id", null: false
    t.bigint "pessoa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["endereco_id"], name: "index_enderecos_on_atendimento_id"
    t.index ["pessoa_id"], name: "index_pessoas_on_atendimento_id"
  end


  add_foreign_key "bairros", "cidades"
  add_foreign_key "cidades", "estados"
  add_foreign_key "enderecos", "logradouros"
  add_foreign_key "logradouros", "bairros"
  add_foreign_key "logradouros", "cidades"
  add_foreign_key "pessoas", "enderecos"
  add_foreign_key "pessoas", "users"
  add_foreign_key "atendimentos", "enderecos"
  add_foreign_key "atendimentos", "pessoas"
end
