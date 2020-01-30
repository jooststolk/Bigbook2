class InlineFormsCreateWords < ActiveRecord::Migration[5.0]

  def self.up
    create_table :words do |t|
      t.string :name 
      t.string :vertaling 
      t.string :ingesproken_woord 
      t.belongs_to :bigimage 
      t.timestamps
    end
  end

  def self.down
    drop_table :words
  end

end
