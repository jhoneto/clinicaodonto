class CreateHorarios < ActiveRecord::Migration
  def self.up
    create_table :horarios do |t|
      t.integer :dentista_id, :null => false, :options => "CONSTRAINT flo_fk_hor_den REFERENCES dentistas(id)"
      t.integer :hor_dia
      t.time :hor_horaini
      t.time :hor_horafim

      t.timestamps
    end
  end

  def self.down
    drop_table :horarios
  end
end
