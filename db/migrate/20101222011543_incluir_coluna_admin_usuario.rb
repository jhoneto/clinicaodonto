class IncluirColunaAdminUsuario < ActiveRecord::Migration
  def self.up
    add_column(:usuarios, :usu_admin, :boolean)
  end

  def self.down
    remove_column(:usuarios, :usu_admin)
  end
end
