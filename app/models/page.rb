class Page < ApplicationRecord
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  belongs_to :languageversion
  belongs_to :bigimage
  belongs_to :gametype

  has_many :gameimages
  has_many :words

  def _presentation
    "#{name}"
  end


  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :name , "name", :text_field ], 
      [ :bigimage , "bigimage", :dropdown ], 
      [ :gametype , "gametype", :dropdown ], 
      [ :gameimages , "gameimages", :associated ], 
      [ :words , "words", :associated ], 
    ]
  end


  def self.not_accessible_through_html?
    true
  end

  def self.order_by_clause
    "name"
  end


end
