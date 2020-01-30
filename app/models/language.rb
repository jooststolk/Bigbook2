class Language < ApplicationRecord
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  mount_uploader :image, ImageUploader

  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :iso_code , "iso_code", :text_field ], 
      [ :sub_code , "sub_code", :text_field ], 
      [ :name , "name", :text_field ], 
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
