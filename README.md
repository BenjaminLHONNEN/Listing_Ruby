# README

## Groupe owuwuewewe-onytnwewe-ungturtwhen-ossas

* Baptiste DUMONT baptiste.dumont@ynov.com 
* Benjamin L'HONNEN benjamin.lhonnen@ynov.com 

https://www.youtube.com/watch?v=VG2WOZx4FVE

##Url de production

http://ruby.lhonnenbenjamin.fr/

##

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
     * 2.4.4

* System dependencies
     * gem install bundle
     * bundle install

* Configuration
     * Database Mysql
    

* Database creation
    * rake db:create
* Database initialization
     * rake db:migrate
     * rake db:fixtures:load

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
     * gem install bundle
     * bundle install
     * rake db:migrate
     * rake db:fixtures:load

* User test
     * Email : admin@domaine.com    Password : 123Pass123
     * Email : user@domaine.com     Password : 123Pass123

# ListingRuby
Projet de ruby, 
Copie le principe du site LeBonCoin.

# ListingRuby - API
**Routes**
    Génération du token http://localhost:3000/api/v1/auth/login
****
**Routes**
Articles API
```
GET    /api/v1/articles(.:format)                                                           
POST   /api/v1/articles(.:format)                                                           
GET    /api/v1/articles/new(.:format)                                                       
GET    /api/v1/articles/:id/edit(.:format)                                                  
GET    /api/v1/articles/:id(.:format)                                                       
PATCH  /api/v1/articles/:id(.:format)                                                       
PUT    /api/v1/articles/:id(.:format)                                                       
DELETE /api/v1/articles/:id(.:format)                                                       
```
****
**Routes**
Conversation API
```
GET    /api/v1/conversations(.:format)                                                      
POST   /api/v1/conversations(.:format) 
```
****
**Routes**
Messages API
```
GET    /api/v1/conversations/:conversation_id/messages(.:format)                                
POST   /api/v1/conversations/:conversation_id/messages(.:format) 
```
****
**Routes**
Users API
```
GET    /api/v1/users(.:format)                                                              
POST   /api/v1/users(.:format)                                                              
GET    /api/v1/users/new(.:format)                                                          
GET    /api/v1/users/:id/edit(.:format)                                                     
GET    /api/v1/users/:id(.:format)                                                          
PATCH  /api/v1/users/:id(.:format)                                                          
PUT    /api/v1/users/:id(.:format)                                                          
DELETE /api/v1/users/:id(.:format)                                   
```