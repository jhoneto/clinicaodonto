class CreateClinicas < ActiveRecord::Migration
  def self.up
    create_table :clinicas do |t|
      t.string :cli_nome, :limit => 60, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :clinicas
  end
end
