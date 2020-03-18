class InlineFormsCreateLanguageversions < ActiveRecord::Migration[5.0]

  def self.up
    create_table :languageversions do |t|
      t.string :name 
      t.belongs_to :language 
      t.string :title 
      t.belongs_to :bigbook 
      t.timestamps
    end
  end

  def self.down
    drop_table :languageversions
  end

end
