# Remove the files -----------------------------------------------------------------------------

# Models
rm -v app/models/word.rb
rm -v app/models/bigimage.rb
rm -v app/models/language.rb
rm -v app/models/gameimage.rb
rm -v app/models/page.rb
rm -v app/models/languageversion.rb
rm -v app/models/bigbook.rb

#Controllers
rm -v app/controllers/bigimages_controller.rb
rm -v app/controllers/gameimages_controller.rb
rm -v app/controllers/languages_controller.rb
rm -v app/controllers/words_controller.rb
rm -v app/controllers/pages_controller.rb
rm -v app/controllers/languageversions_controller.rb
rm -v app/controllers/bigbooks_controller.rb

# Migration Files
rm -v db/migrate/*_languages.rb
rm -v db/migrate/*_words.rb
rm -v db/migrate/*_gameimages.rb
rm -v db/migrate/*_bigimages.rb
rm -v db/migrate/*_pages.rb
rm -v db/migrate/*_languageversions.rb
rm -v db/migrate/*_bigbooks.rb

# Unit Tests
rm -v test/unit/bigimage_test.rb
rm -v test/unit/gameimage_test.rb
rm -v test/unit/page_test.rb
rm -v test/unit/language_test.rb
rm -v test/unit/word_test.rb
rm -v test/unit/languageversion_test.rb
rm -v test/unit/bigbook_test.rb
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
END_SQL
#---------------------------------------------------------------------------------------------------------

# Create the models --------------------------------------------------------------------------------------
rails g inline_forms Language iso_code:string sub_code:string name:string image:image_field 
rails g inline_forms Word name:string vertaling:string ingesproken_woord:string bigimage:belongs_to page:belongs_to _presentation:'#{name}'
rails g inline_forms Gameimage name:string image:image_field bigimage:belongs_to _presentation:'#{name}'
rails g inline_forms Bigimage name:string image:image_field words:has_many words:associated gametype:string gameimages:has_many \
gameimages:associated _enabled:yes _presentation:'#{name}'
rails g inline_forms Page name:string bigimage:dropdown words:has_many words:associated _enabled:yes _presentation:'#{name}'
rails g inline_forms Languageversion language:dropdown titel:string frontpageimage:string 
rails g inline_forms Bigbook name:string defaultfrontpageimage:image_field bigimages:associated defaultbackpageimage:image_field \
navigationnextimage:image_field navigationpreviousimage:image_field navigationgamesimage:image_field navigationrestartimage:image_field \
navigationbackfromgamesimage:image_field defaultcardbacksideimage:image_field languageversions:associated active:string _enabled:yes _presentation:'#{name}'
#----------------------------------------------------------------------------------------------------------

rake db:migrate