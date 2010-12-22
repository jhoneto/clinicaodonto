class CreateConsultas < ActiveRecord::Migration
  def self.up
    create_table :consultas do |t|
      t.integer :dentista_id
      t.integer :paciente_id
      t.date :con_hora
      t.date :con_data
      t.integer :con_status

      t.timestamps
    end
  end

  def self.down
    drop_table :consultas
  end
end
