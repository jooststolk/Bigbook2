#-----------------------------------------------------------------------------
# Add to bigbook.rb

after_create:create_languageversion 

  private
    def create_languageversion
     lv = Languageversion.create({ name: "Papiamentu", language_id: 3, title: 'Mi Bigbook' ,bigbook_id: self.id })
     bi=Bigimage.create({ name: 'Mi Bigimage', bigbook_id: self.id})
     Bigimagelanguageversion.create({ name: 'Mi Bigimage Papiamentu', languageversion_id: lv.id, bigimage_id: bi.id })
    end

 #-----------------------------------------------------------------------------------------------------------------------


 