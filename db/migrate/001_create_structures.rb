class CreateStructures < ActiveRecord::Migration
  def self.up
    create_table :structures do |t|
      t.string :name, :class_name
      t.timestamps
    end
  end

  def self.down
    drop_table :structures
  end
end
