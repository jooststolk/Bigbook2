class Page < ApplicationRecord
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  has_many :bigimages
  has_many :words

  def _presentation
    "#{name}"
  end


  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :name , "name", :text_field ], 
      [ :big_images , "big_images", :associated ], 
      [ :words , "words", :associated ], 
    ]
  end


  def self.not_accessible_through_html?
    false
  end

  def self.order_by_clause
    "name"
  end


end
