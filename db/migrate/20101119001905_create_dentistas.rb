class CreateDentistas < ActiveRecord::Migration
  def self.up
    create_table :dentistas do |t|
      t.string :den_nome

      t.timestamps
    end
  end

  def self.down
    drop_table :dentistas
  end
end
