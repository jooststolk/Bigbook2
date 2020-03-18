class Languageversion < ApplicationRecord
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  belongs_to :language
  belongs_to :bigbook

  has_many :pages

  def _presentation
    "#{name}"
  end


  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :name , "name", :text_field ], 
      [ :language , "language", :dropdown ], 
      [ :title , "title", :text_field ], 
      [ :pages , "pages", :associated ], 
    ]
  end


  def self.not_accessible_through_html?
    true
  end

  def self.order_by_clause
    "name"
  end


end
