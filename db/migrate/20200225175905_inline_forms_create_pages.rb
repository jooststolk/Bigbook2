class InlineFormsCreatePages < ActiveRecord::Migration[5.0]

  def self.up
    create_table :pages do |t|
      t.string :name 
      t.belongs_to :bigimage 
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end

end
