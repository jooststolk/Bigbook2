class InlineFormsCreateLanguageversions < ActiveRecord::Migration[5.0]

  def self.up
    create_table :languageversions do |t|
      t.belongs_to :language 
      t.string :titel 
      t.string :frontpageimage 
      t.timestamps
    end
  end

  def self.down
    drop_table :languageversions
  end

end
