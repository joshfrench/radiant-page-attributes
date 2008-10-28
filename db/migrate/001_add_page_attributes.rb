class AddPageAttributes < ActiveRecord::Migration
  def self.up
    create_table :page_attributes do |t|
      t.column :name, :string
      t.column :class_name, :string
      t.column :value, :text
      t.column :page_id, :integer
      t.timestamps
    end
    add_index :page_attributes, :page_id
    add_index :page_attributes, :class_name
  end

  def self.down
    drop_table :page_attributes
    remove_index :page_attributes, :page_id
    remove_index :page_attributes, :class_name
  end
end
