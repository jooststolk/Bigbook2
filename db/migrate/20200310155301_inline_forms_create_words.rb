class InlineFormsCreateWords < ActiveRecord::Migration[5.0]

  def self.up
    create_table :words do |t|
      t.string :name 
      t.string :translation 
      t.string :spoken_word 
      t.belongs_to :page 
      t.timestamps
    end
  end

  def self.down
    drop_table :words
  end

end
