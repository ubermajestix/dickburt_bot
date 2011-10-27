DICKBURT!!!!
============
A campfire bot that runs on heroku, powered by fbomb.

Setup
------
To get the heroku gem and foreman

    bundle install
    
Setup a server with heroku (I'll assume you have an account)

    heroku create insertbotservernamehere --stack=cedar

Setup your token, room, and subdomain as ENV variables. 
(I'll assume you know how to get an api token for Campfire)

    heroku config:add CAMPFIRE_TOKEN=yourcampfiretoken
    heroku config:add CAMPFIRE_ROOM="Name of your Room"
    heroku config:add CAMPFIRE_ACCOUNT=subdomainofyouraccount

Push!
  
    git push heroku master

Heroku workers
--------------
    
Spin up the worker
  
    heroku scale worker=1

Spin down the worker

    heroku scale worker=0
    
Restart

     heroku scale worker=0;  heroku scale worker=1
  


    
