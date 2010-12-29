class CreateMeuscontatos < ActiveRecord::Migration
  def self.up
    create_table :meuscontatos do |t|
      t.integer :usuario_id, :null => false, :options => "CONSTRAINT flo_fk_mct_usu REFERENCES usuarios(id)"
      t.integer :contato_id, :null => false, :options => "CONSTRAINT flo_fk_mct_ctt REFERENCES contatos(id)"

      t.timestamps
    end
    add_index :meuscontatos, [:contato_id, :usuario_id], :unique => true
  end

  def self.down
    drop_table :meuscontatos
  end
end
