rails g inline_forms Language iso_code:string sub_code:string name:string image:image_field 
rails g inline_forms Word name:string vertaling:string ingesproken_woord:string bigimage:belongs_to _presentation:'#{name}'
rails g inline_forms Gameimage name:string image:image_field bigimage:belongs_to _presentation:'#{name}'
rails g inline_forms Bigimage name:string image:image_field words:has_many words:associated gametype:string gameimages:has_many gameimages:associated _enabled:yes _presentation:'#{name}'