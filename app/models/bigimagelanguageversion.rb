class Bigimagelanguageversion < ApplicationRecord
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  mount_uploader :image, ImageUploader

  belongs_to :languageversion
  belongs_to :bigimage

  def _presentation
    "#{name}"
  end


  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :name , "name", :text_field ], 
      [ :languageversion , "languageversion", :dropdown ], 
      [ :image , "image", :image_field ], 
    ]
  end


  def self.not_accessible_through_html?
    true
  end

  def self.order_by_clause
    "name"
  end


end
