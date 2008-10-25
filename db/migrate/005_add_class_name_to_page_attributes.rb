class AddClassNameToPageAttributes < ActiveRecord::Migration
  def self.up
    add_column :page_attributes, :class_name, :string
  end
  
  def self.down
    remove_column :page_attributes, :class_name
  end
end