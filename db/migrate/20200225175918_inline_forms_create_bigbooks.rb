class InlineFormsCreateBigbooks < ActiveRecord::Migration[5.0]

  def self.up
    create_table :bigbooks do |t|
      t.string :name 
      t.string :defaultfrontpageimage 
      t.string :defaultbackpageimage 
      t.string :navigationnextimage 
      t.string :navigationpreviousimage 
      t.string :navigationgamesimage 
      t.string :navigationrestartimage 
      t.string :navigationbackfromgamesimage 
      t.string :defaultcardbacksideimage 
      t.string :active 
      t.timestamps
    end
  end

  def self.down
    drop_table :bigbooks
  end

end
