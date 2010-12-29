class CreateContatos < ActiveRecord::Migration
  def self.up
    create_table :contatos do |t|
      t.string :ctt_nome, :limit =>100, :null => false
      t.string :ctt_fone1, :limit =>14, :null => false
      t.string :ctt_fone2, :limit =>14, :null => true
      t.string :ctt_obs, :limit =>255, :null => true

      t.timestamps
    end
  end

  def self.down
    drop_table :contatos
  end
end
