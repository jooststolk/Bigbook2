class InlineFormsCreateBigimages < ActiveRecord::Migration[5.0]

  def self.up
    create_table :bigimages do |t|
      t.string :name 
      t.belongs_to :bigbook 
      t.timestamps
    end
  end

  def self.down
    drop_table :bigimages
  end

end
