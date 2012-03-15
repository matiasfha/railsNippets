class CreateLenguajes < ActiveRecord::Migration
  def self.up
    create_table :lenguajes do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :lenguajes
  end
end
