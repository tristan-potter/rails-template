# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

To create a Heroku app:

`heroku apps:create`

Verify the heroku remote is added with: `git config --list --local | grep heroku`

Create a postgres database for the app: `heroku addons:create heroku-postgresql:mini`

Push the app to Heroku to deploy: `git push heroku main`

Migrate the database: `heroku run rake db:migrate`

Can check usage using: `heroku ps`

- ...
