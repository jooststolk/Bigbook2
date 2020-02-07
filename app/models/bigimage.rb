class Bigimage < ApplicationRecord
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  mount_uploader :image, ImageUploader

  belongs_to :page

  has_many :words
  has_many :gameimages

  def _presentation
    "#{name}"
  end


  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :name , "name", :text_field ], 
      [ :image , "image", :image_field ], 
      [ :words , "words", :associated ], 
      [ :gametype , "gametype", :text_field ], 
      [ :gameimages , "gameimages", :associated ], 
    ]
  end


  def self.not_accessible_through_html?
    false
  end

  def self.order_by_clause
    "name"
  end


end
