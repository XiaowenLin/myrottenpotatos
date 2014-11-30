#! /bin/bash
# create model for movie goer
rails generate model Moviegoer name:string provider:string uid:string
rake db:migrate

# create controller for sessions
rails generate controller Sessions
