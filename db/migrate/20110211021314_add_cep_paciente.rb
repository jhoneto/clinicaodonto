class AddCepPaciente < ActiveRecord::Migration
  def self.up
    add_column(:pacientes, :pac_cep, :string, :limit=>10)
  end

  def self.down
    remove_column(:pacientes, :pac_cep)
  end
end
