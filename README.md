# README

This is an NBA Fantasy 3-on-3 Team Builder

Video Walk-Through:
https://youtu.be/0qWo1vm6D9k

Blog Post about creating this project for Flatiron:
https://jerkzilla.github.io/rails_project_how_to_prepare

Getting started

To get the Rails server running locally:

-Clone this repo

-bundle install to install all req'd dependencies

-rake db:migrate to make all database migrations

-rails s to start the local server

Dependencies

-Devise - For implementing authentication

-Omniauth - User sign-in/sign-up through Github

Folders

app/models - Contains the database models for the application where we can define methods, validations, queries, and relations to other models.

app/views - Contains templates for pages presented to user

app/controllers - Contains the controllers where requests are routed to their actions, where we find and manipulate our models and return them for the views to render.

config - Contains configuration files for our Rails application and for our database, along with an initializers folder for scripts that get run on boot.

db - Contains the migrations needed to create our database schema.
