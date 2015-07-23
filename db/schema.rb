# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150530151239) do

  create_table "clientes", force: true do |t|
    t.string   "nm_cliente"
    t.integer  "num_tel_cliente"
    t.string   "nm_endereco_cliente"
    t.integer  "num_endereco"
    t.string   "nm_complemento"
    t.string   "nm_bairro"
    t.string   "nm_cidade"
    t.string   "nm_uf"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cep"
  end

  create_table "itens", force: true do |t|
    t.string   "nm_item"
    t.float    "qtd_item",   limit: 24
    t.float    "vl_item",    limit: 24
    t.text     "ds_item"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itens_pedidos", id: false, force: true do |t|
    t.integer "item_id"
    t.integer "pedido_id"
    t.float   "qtd_item_pedido", limit: 24
    t.float   "vl_item_pedido",  limit: 24
  end

  create_table "pedidos", force: true do |t|
    t.integer  "cliente_id"
    t.date     "dt_pedido"
    t.float    "vl_total",   limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
