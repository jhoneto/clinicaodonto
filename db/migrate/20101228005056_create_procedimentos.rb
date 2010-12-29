class CreateProcedimentos < ActiveRecord::Migration
  def self.up
    create_table :procedimentos do |t|
      t.string :pro_nome
      t.string :pro_imagem

      t.timestamps
    end
  end

  def self.down
    drop_table :procedimentos
  end
end
