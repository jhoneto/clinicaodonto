class CorrigirTabelaConsulta < ActiveRecord::Migration
  def self.up
    remove_column :consultas, :dentista_id
    remove_column :consultas, :paciente_id
    remove_column :consultas, :con_data
    remove_column :consultas, :con_hora
    add_column :consultas, :con_paciente, :string, :limit => 50
    add_column :consultas, :con_desc, :string, :limit => 255
    add_column :consultas, :con_datahoraini, :datetime
    add_column :consultas, :con_datahorafim, :datetime
  end

  def self.down
    add_column :consultas, :dentista_id, :integer
    add_column :consultas, :paciente_id, :integer
    add_column :consultas, :con_data, :date
    add_column :consultas, :con_hora, :time
    remove_column :consultas, :con_paciente
    remove_column :consultas, :con_desc
    remove_column :consultas, :con_datahoraini
    remove_column :consultas, :con_datahorafim
  end
end
