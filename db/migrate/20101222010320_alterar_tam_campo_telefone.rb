class AlterarTamCampoTelefone < ActiveRecord::Migration
  def self.up
    remove_column(:pacientes, :pac_fone)
    remove_column(:pacientes, :pac_celular)
    add_column(:pacientes, :pac_fone, :string, :limit => 13)
    add_column(:pacientes, :pac_celular, :string, :limit => 13)
  end

  def self.down
  end
end
