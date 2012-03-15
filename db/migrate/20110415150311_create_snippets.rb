class CreateSnippets < ActiveRecord::Migration
  def self.up
    create_table :snippets do |t|
      t.string :title
      t.text :codigo
      t.text :descripcion
      t.string :tags
      t.integer :id_user
      t.integer :lenguaje

      t.timestamps
    end
  end

  def self.down
    drop_table :snippets
  end
end
