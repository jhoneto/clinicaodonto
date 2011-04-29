# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110427212842) do

  create_table "clinicas", :force => true do |t|
    t.string   "cli_nome",   :limit => 60, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultas", :force => true do |t|
    t.integer  "con_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "con_paciente",    :limit => 50
    t.string   "con_desc"
    t.datetime "con_datahoraini"
    t.datetime "con_datahorafim"
    t.string   "con_fone",        :limit => 13
  end

  create_table "contatos", :force => true do |t|
    t.string   "ctt_nome",   :limit => 100, :null => false
    t.string   "ctt_fone1",  :limit => 14,  :null => false
    t.string   "ctt_fone2",  :limit => 14
    t.string   "ctt_obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "clinica_id"
  end

  create_table "dentistas", :force => true do |t|
    t.string   "den_nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "clinica_id"
  end

  create_table "fichas", :force => true do |t|
    t.integer  "dentista_id", :null => false
    t.integer  "paciente_id", :null => false
    t.date     "fic_data",    :null => false
    t.text     "fic_desc",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "horarios", :force => true do |t|
    t.integer  "dentista_id", :null => false
    t.integer  "hor_dia"
    t.time     "hor_horaini"
    t.time     "hor_horafim"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meuscontatos", :force => true do |t|
    t.integer  "usuario_id", :null => false
    t.integer  "contato_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meuscontatos", ["contato_id", "usuario_id"], :name => "index_meuscontatos_on_contato_id_and_usuario_id", :unique => true

  create_table "odontogramadets", :force => true do |t|
    t.integer  "odontograma_id",  :null => false
    t.integer  "odd_dente"
    t.date     "odd_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "procedimento_id"
  end

  create_table "odontogramas", :force => true do |t|
    t.integer  "paciente_id", :null => false
    t.integer  "odo_tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pacientes", :force => true do |t|
    t.string   "pac_nome",       :limit => 100, :null => false
    t.string   "pac_observacao"
    t.integer  "clinica_id",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pac_endereco",   :limit => 100
    t.string   "pac_bairro",     :limit => 50
    t.string   "pac_cidade",     :limit => 50
    t.string   "pac_uf",         :limit => 2
    t.string   "pac_fone",       :limit => 14
    t.string   "pac_celular",    :limit => 14
    t.string   "pac_cep",        :limit => 10
  end

  create_table "procedimentos", :force => true do |t|
    t.string   "pro_nome"
    t.string   "pro_imagem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "usu_nome",   :limit => 50, :null => false
    t.string   "usu_email",                :null => false
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "usu_login",  :limit => 30
    t.string   "usu_senha"
    t.boolean  "usu_admin"
  end

end
