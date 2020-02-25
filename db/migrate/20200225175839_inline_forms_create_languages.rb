class InlineFormsCreateLanguages < ActiveRecord::Migration[5.0]

  def self.up
    create_table :languages do |t|
      t.string :iso_code 
      t.string :sub_code 
      t.string :name 
      t.string :image 
      t.timestamps
    end
  end

  def self.down
    drop_table :languages
  end

end
