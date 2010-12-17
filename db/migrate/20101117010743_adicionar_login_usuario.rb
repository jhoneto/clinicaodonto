class AdicionarLoginUsuario < ActiveRecord::Migration
  def self.up
    add_column(:usuarios, :usu_login, :string, :limit => 30)
  end

  def self.down
     remove_column(:usuarios, :usu_login) 
  end
end
