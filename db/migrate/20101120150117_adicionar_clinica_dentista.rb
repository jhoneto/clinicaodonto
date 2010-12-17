class AdicionarClinicaDentista < ActiveRecord::Migration
  def self.up
    add_column(:dentistas, :clinica_id, :integer, :options => "CONSTRAINT flo_fk_den_cli REFERENCES clinicas(id)")
  end

  def self.down
    remove_column(:dentistas, :clinica_id) 
  end
end
