class InlineFormsCreateGametypes < ActiveRecord::Migration[5.0]

  def self.up
    create_table :gametypes do |t|
      t.string :name 
      t.timestamps
    end
  end

  def self.down
    drop_table :gametypes
  end

end
