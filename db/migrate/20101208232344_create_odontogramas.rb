class CreateOdontogramas < ActiveRecord::Migration
  def self.up
    create_table :odontogramas do |t|
      t.integer :paciente_id, :null => false, :options => "CONSTRAINT flo_fk_odo_pac REFERENCES pacientes(id)"
      t.integer :odo_tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :odontogramas
  end
end
