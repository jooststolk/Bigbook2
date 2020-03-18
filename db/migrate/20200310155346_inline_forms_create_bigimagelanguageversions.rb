class InlineFormsCreateBigimagelanguageversions < ActiveRecord::Migration[5.0]

  def self.up
    create_table :bigimagelanguageversions do |t|
      t.string :name 
      t.belongs_to :languageversion 
      t.string :image 
      t.belongs_to :bigimage 
      t.timestamps
    end
  end

  def self.down
    drop_table :bigimagelanguageversions
  end

end
