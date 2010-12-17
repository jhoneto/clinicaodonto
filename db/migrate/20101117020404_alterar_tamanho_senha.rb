class AlterarTamanhoSenha < ActiveRecord::Migration
  def self.up
    remove_column(:usuarios, :usu_senha)
    add_column(:usuarios, :usu_senha, :string, :limit => 255)
  end

  def self.down
  end
end
