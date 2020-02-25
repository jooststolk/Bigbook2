class Languageversion < ApplicationRecord
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  belongs_to :language

  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :language , "language", :dropdown ], 
      [ :titel , "titel", :text_field ], 
      [ :frontpageimage , "frontpageimage", :text_field ], 
    ]
  end


  def self.not_accessible_through_html?
    true
  end

  def self.order_by_clause
    "name"
  end


end
