class AlterarTipoHoraConsulta < ActiveRecord::Migration
  def self.up
    remove_column(:consultas, :con_hora)
    add_column(:consultas, :con_hora, :time)
  end

  def self.down
  end
end
