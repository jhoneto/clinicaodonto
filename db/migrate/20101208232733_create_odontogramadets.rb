class CreateOdontogramadets < ActiveRecord::Migration
  def self.up
    create_table :odontogramadets do |t|
      t.integer :odontograma_id, :null => false, :options => "CONSTRAINT flo_fk_odd_odo REFERENCES odontogramas(id)"
      t.integer :odd_dente
      t.date :odd_data
      t.integer :odd_acao

      t.timestamps
    end
  end

  def self.down
    drop_table :odontogramadets
  end
end
