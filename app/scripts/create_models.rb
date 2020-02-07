# Remove the files -----------------------------------------------------------------------------

# Models
[ -e "app/models/word.rb" ] &&  rm app/models/word.rb
[ -e "app/models/bigimage.rb" ] && rm app/models/bigimage.rb
[ -e "app/models/language.rb" ] && rm app/models/language.rb
[ -e "app/models/gameimage.rb" ] && rm app/models/gameimage.rb
[ -e "app/models/page.rb" ] && rm app/models/page.rb

#Controllers
[ -e "app/controllers/bigimages_controller.rb" ] && rm app/controllers/bigimages_controller.rb
[ -e "app/controllers/gameimages_controller.rb" ] && rm app/controllers/gameimages_controller.rb
[ -e "app/controllers/languages_controller.rb" ] && rm app/controllers/languages_controller.rb
[ -e "app/controllers/words_controller.rb" ] && rm app/controllers/words_controller.rb
[ -e "app/controllers/pages_controller.rb" ] && rm app/controllers/pages_controller.rb

# Migration Files
[ -e "db/migrate/*_languages.rb" ] && rm db/migrate/*_languages.rb
[ -e "db/migrate/*_words.rb" ] && rm db/migrate/*_words.rb
[ -e "db/migrate/*_gameimages.rb" ] && rm db/migrate/*_gameimages.rb
[ -e "db/migrate/*_bigimages.rb" ] && rm db/migrate/*_bigimages.rb
[ -e "db/migrate/*_pages.rb" ] && rm db/migrate/*_pages.rb

# Unit Tests
[ -e "test/unit/bigimage_test.rb" ] && rm test/unit/bigimage_test.rb
[ -e "test/unit/gameimage_test.rb" ] && rm test/unit/gameimage_test.rb
[ -e "rm test/unit/page_test.rb" ] && rm test/unit/page_test.rb
[ -e "test/unit/language_test.rb" ] && rm test/unit/language_test.rb
[ -e "test/unit/word_test.rb" ] && rm test/unit/word_test.rb
#-------------------------------------------------------------------------------------------------------

#Drop the tables ---------------------------------------------------------------------------------------

#!/bin/sh

sqlite3 db/development.sqlite3 <<END_SQL
drop table if exists languages;
drop table if exists bigimages;
drop table if exists pages;
drop table if exists gameimages;
drop table if exists words;
END_SQL
#---------------------------------------------------------------------------------------------------------

# Create the models --------------------------------------------------------------------------------------
rails g inline_forms Language iso_code:string sub_code:string name:string image:image_field 
rails g inline_forms Word name:string vertaling:string ingesproken_woord:string bigimage:belongs_to page:belongs_to _presentation:'#{name}'
rails g inline_forms Gameimage name:string image:image_field bigimage:belongs_to _presentation:'#{name}'
rails g inline_forms Bigimage name:string image:image_field words:has_many words:associated gametype:string gameimages:has_many gameimages:associated page:belongs_to _enabled:yes _presentation:'#{name}'
rails g inline_forms Page name:string bigimages:has_many big_images:associated words:has_many words:associated _enabled:yes _presentation:'#{name}'

#----------------------------------------------------------------------------------------------------------

rake db:migrate