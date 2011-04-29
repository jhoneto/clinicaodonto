class AdicionarTelefoneConsulta < ActiveRecord::Migration
  def self.up
    add_column(:consultas, :con_fone, :string, :limit => 13)
  end

  def self.down
    remove_column :consultas, :con_fone
  end
end
