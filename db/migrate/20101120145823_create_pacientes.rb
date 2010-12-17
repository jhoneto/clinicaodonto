class CreatePacientes < ActiveRecord::Migration
  def self.up
    create_table :pacientes do |t|
      t.string :pac_nome, :limit => 100, :null => false
      t.string :pac_fone, :limit => 10, :null => false
      t.string :pac_celular, :limit => 10, :null => false
      t.string :pac_observacao
      t.integer :clinica_id,:null => false, :options => "CONSTRAINT flo_fk_pac_cli REFERENCES clinicas(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :pacientes
  end
end
