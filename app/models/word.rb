class Word < ApplicationRecord
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  belongs_to :page

  def _presentation
    "#{name}"
  end


  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :name , "name", :text_field ], 
      [ :translation , "translation", :text_field ], 
      [ :spoken_word , "spoken_word", :text_field ], 
    ]
  end


  def self.not_accessible_through_html?
    true
  end

  def self.order_by_clause
    "name"
  end


end
