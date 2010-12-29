class AlterarAcaoOdontogramadet < ActiveRecord::Migration
  def self.up
    remove_column(:odontogramadets, :odd_acao)
    add_column (:odontogramadets, :procedimento_id, :integer, :options => "CONSTRAINT flo_fk_odd_pro REFERENCES procedimentos(id)")
  end

  def self.down
  end
end
