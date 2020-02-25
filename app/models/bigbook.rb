class Bigbook < ApplicationRecord
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  mount_uploader :defaultfrontpageimage, DefaultfrontpageimageUploader
  mount_uploader :defaultbackpageimage, DefaultbackpageimageUploader
  mount_uploader :navigationnextimage, NavigationnextimageUploader
  mount_uploader :navigationpreviousimage, NavigationpreviousimageUploader
  mount_uploader :navigationgamesimage, NavigationgamesimageUploader
  mount_uploader :navigationrestartimage, NavigationrestartimageUploader
  mount_uploader :navigationbackfromgamesimage, NavigationbackfromgamesimageUploader
  mount_uploader :defaultcardbacksideimage, DefaultcardbacksideimageUploader

  def _presentation
    "#{name}"
  end


  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :name , "name", :text_field ], 
      [ :defaultfrontpageimage , "defaultfrontpageimage", :image_field ], 
      [ :bigimages , "bigimages", :associated ], 
      [ :defaultbackpageimage , "defaultbackpageimage", :image_field ], 
      [ :navigationnextimage , "navigationnextimage", :image_field ], 
      [ :navigationpreviousimage , "navigationpreviousimage", :image_field ], 
      [ :navigationgamesimage , "navigationgamesimage", :image_field ], 
      [ :navigationrestartimage , "navigationrestartimage", :image_field ], 
      [ :navigationbackfromgamesimage , "navigationbackfromgamesimage", :image_field ], 
      [ :defaultcardbacksideimage , "defaultcardbacksideimage", :image_field ], 
      [ :languageversions , "languageversions", :associated ], 
      [ :active , "active", :text_field ], 
    ]
  end


  def self.not_accessible_through_html?
    false
  end

  def self.order_by_clause
    "name"
  end


end
