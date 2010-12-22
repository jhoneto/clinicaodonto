class AlterarTamCampoTelefone2 < ActiveRecord::Migration
  def self.up
    remove_column(:pacientes, :pac_fone)
    remove_column(:pacientes, :pac_celular)
    add_column(:pacientes, :pac_fone, :string, :limit => 14)
    add_column(:pacientes, :pac_celular, :string, :limit => 14)
  end

  def self.down
  end
end
