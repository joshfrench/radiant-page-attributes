class DropStructure < ActiveRecord::Migration
  def self.up
    drop_table :structures
  end
  
  def self.down
    create_table "structures", :force => true do |t|
      t.string   "name"
      t.string   "class_name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end