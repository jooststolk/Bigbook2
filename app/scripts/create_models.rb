# Remove the files -----------------------------------------------------------------------------

# Models
rm -v app/models/word.rb
rm -v app/models/bigimage.rb
rm -v app/models/language.rb
rm -v app/models/gameimage.rb
rm -v app/models/page.rb
rm -v app/models/languageversion.rb
rm -v app/models/bigbook.rb
rm -v app/models/gametype.rb
rm -v app/models/bigimagelanguageversion.rb


#Controllers
rm -v app/controllers/bigimages_controller.rb
rm -v app/controllers/gameimages_controller.rb
rm -v app/controllers/languages_controller.rb
rm -v app/controllers/words_controller.rb
rm -v app/controllers/pages_controller.rb
rm -v app/controllers/languageversions_controller.rb
rm -v app/controllers/bigbooks_controller.rb
rm -v app/controllers/gametypes_controller.rb
rm -v app/controllers/bigimagelanguageversions_controller.rb

# Migration Files
rm -v db/migrate/*_languages.rb
rm -v db/migrate/*_words.rb
rm -v db/migrate/*_gameimages.rb
rm -v db/migrate/*_bigimages.rb
rm -v db/migrate/*_pages.rb
rm -v db/migrate/*_languageversions.rb
rm -v db/migrate/*_bigbooks.rb
rm -v db/migrate/*_gametypes.rb
rm -v db/migrate/*_bigimagelanguageversions.rb

# Unit Tests
rm -v test/unit/bigimage_test.rb
rm -v test/unit/gameimage_test.rb
rm -v test/unit/page_test.rb
rm -v test/unit/language_test.rb
rm -v test/unit/word_test.rb
rm -v test/unit/languageversion_test.rb
rm -v test/unit/bigbook_test.rb
rm -v test/unit/gametype_test.rb
rm -v test/unit/bigimagelanguageversion_test.rb
#-------------------------------------------------------------------------------------------------------

#Drop the tables ---------------------------------------------------------------------------------------

#!/bin/sh

sqlite3 db/development.sqlite3 <<END_SQL
drop table if exists languages;
drop table if exists bigimages;
drop table if exists pages;
drop table if exists gameimages;
drop table if exists words;
drop table if exists languageversions;
drop table if exists bigbooks;
drop table if exists gametypes;
drop table if exists bigimagelanguageversions;
END_SQL
#---------------------------------------------------------------------------------------------------------

# Create the models --------------------------------------------------------------------------------------
rails g inline_forms Language name:string iso_code:string sub_code:string image:image_field  _presentation:'#{name}'

rails g inline_forms Word name:string translation:string spoken_word:string page:belongs_to  _presentation:'#{name}'

rails g inline_forms Gameimage name:string image:image_field page:belongs_to _presentation:'#{name}'

rails g inline_forms Gametype name:string  _presentation:'#{name}'

rails g inline_forms Bigimage name:string bigimagelanguageversions:associated bigimagelanguageversions:has_many bigbook:belongs_to _presentation:'#{name}'

rails g inline_forms Page name:string languageversion:belongs_to bigimage:dropdown  \
gametype:dropdown gameimages:associated gameimages:has_many words:has_many words:associated _presentation:'#{name}'

rails g inline_forms Languageversion name:string language:dropdown title:string  bigbook:belongs_to \
pages:associated pages:has_many  _presentation:'#{name}'

rails g inline_forms Bigbook name:string active:string defaultfrontpageimage:image_field defaultbackpageimage:image_field navigationnextimage:image_field \
navigationpreviousimage:image_field navigationgamesimage:image_field navigationrestartimage:image_field \
navigationbackfromgamesimage:image_field defaultcardbacksideimage:image_field \
bigimages:associated bigimages:has_many languageversions:associated  languageversions:has_many _enabled:yes _presentation:'#{name}'

rails g inline_forms Bigimagelanguageversion name:string languageversion:dropdown image:image_field bigimage:belongs_to  _presentation:'#{name}'
#----------------------------------------------------------------------------------------------------------

rake db:migrate

rake db:seed

