class DropStructureId < ActiveRecord::Migration
  def self.up
    remove_column :page_attributes, :structure_id
  end
  
  def self.down
    add_column :page_attributes, :structure_id, :integer
  end
end