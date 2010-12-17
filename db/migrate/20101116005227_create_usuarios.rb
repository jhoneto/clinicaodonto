class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :usu_nome, :limit => 50, :null => false
      t.string :usu_email, :limit => 255, :null => false
      t.string :usu_senha, :limit => 10, :null => false
      t.integer :clinica_id, :options => "CONSTRAINT flo_fk_usu_cli REFERENCES clinicas(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
