class AdicionarClinicaContato < ActiveRecord::Migration
  def self.up
    add_column(:contatos, :clinica_id, :integer, :options => "CONSTRAINT flo_fk_ctt_cli REFERENCES clinicas(id)")
  end

  def self.down
    remove_column(:contatos, :clinica_id) 
  end
end
