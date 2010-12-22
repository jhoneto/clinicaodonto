class NovosCamposPaciente < ActiveRecord::Migration
  def self.up
    add_column(:pacientes, :pac_endereco, :string, :limit => 100)
    add_column(:pacientes, :pac_bairro, :string, :limit => 50)
    add_column(:pacientes, :pac_cidade, :string, :limit => 50)
    add_column(:pacientes, :pac_uf, :string, :limit => 2)
  end

  def self.down
    remove_column(:pacientes, :pac_endereco)
    remove_column(:pacientes, :pac_bairro)
    remove_column(:pacientes, :pac_cidade)
    remove_column(:pacientes, :pac_uf)
  end
end
