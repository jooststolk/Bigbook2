class InlineFormsCreatePhotos < ActiveRecord::Migration[5.0]

  def self.up
    create_table :photos do |t|
      t.string :name 
      t.string :caption 
      t.string :image 
      t.text :description 
      t.belongs_to :apartment 
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end

end
