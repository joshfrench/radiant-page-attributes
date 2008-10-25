class CreatePageAttributes < ActiveRecord::Migration
  def self.up
    create_table :page_attributes do |t|
      t.integer :page_id, :structure_id
      t.string :name
      t.text :value
      t.timestamps
    end
    add_index :page_attributes, [:page_id, :structure_id]
  end

  def self.down
    drop_table :page_attributes
    remove_index :page_attributes, [:page_id, :structure_id]
  end
end
