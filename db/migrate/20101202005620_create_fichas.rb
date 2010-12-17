class CreateFichas < ActiveRecord::Migration
  def self.up
    create_table :fichas do |t|
      t.integer :dentista_id, :null => false, :options => "CONSTRAINT flo_fk_fic_den REFERENCES dentistas(id)"
      t.integer :paciente_id, :null => false, :options => "CONSTRAINT flo_fk_fic_pac REFERENCES pacientes(id)"
      t.date :fic_data, :null => false
      t.text :fic_desc, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :fichas
  end
end
