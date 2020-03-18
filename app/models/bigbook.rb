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

  has_many :bigimages
  has_many :languageversions

  def _presentation
    "#{name}"
  end


  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :name , "name", :text_field ], 
      [ :active , "active", :text_field ], 
      [ :defaultfrontpageimage , "defaultfrontpageimage", :image_field ], 
      [ :defaultbackpageimage , "defaultbackpageimage", :image_field ], 
      [ :navigationnextimage , "navigationnextimage", :image_field ], 
      [ :navigationpreviousimage , "navigationpreviousimage", :image_field ], 
      [ :navigationgamesimage , "navigationgamesimage", :image_field ], 
      [ :navigationrestartimage , "navigationrestartimage", :image_field ], 
      [ :navigationbackfromgamesimage , "navigationbackfromgamesimage", :image_field ], 
      [ :defaultcardbacksideimage , "defaultcardbacksideimage", :image_field ], 
      [ :bigimages , "bigimages", :associated ], 
      [ :languageversions , "languageversions", :associated ], 
    ]
  end


  def self.not_accessible_through_html?
    false
  end

  def self.order_by_clause
    "name"
  end

  after_create:create_languageversion 

  private
    def create_languageversion
     lv = Languageversion.create({ name: "Papiamentu", language_id: 3, title: 'Mi Bigbook' ,bigbook_id: self.id })
     bi=Bigimage.create({ name: 'Mi Bigimage', bigbook_id: self.id})
     Bigimagelanguageversion.create({ name: 'Mi Bigimage Papiamentu', languageversion_id: lv.id, bigimage_id: bi.id })
    end

end
