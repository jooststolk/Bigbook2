class InlineFormsCreateGameimages < ActiveRecord::Migration[5.0]

  def self.up
    create_table :gameimages do |t|
      t.string :name 
      t.string :image 
      t.belongs_to :bigimage 
      t.timestamps
    end
  end

  def self.down
    drop_table :gameimages
  end

end
