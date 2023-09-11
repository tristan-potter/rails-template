# README

A minimal Rails template that uses Tailwind and ViewComponent for the frontend
and a PostgreSQL database. Should work out of the box with Heroku.

Run `.bin/setup.sh` to get started, and then `.bin/dev` to run the server.

After cloning this repo, you should change instances of `rails_template`,
`RailsTemplate` and `RAILS_TEMPLATE` to your app name.

## Deployment instructions

To create a Heroku app:

`heroku apps:create`

Verify the heroku remote is added with: `git config --list --local | grep heroku`

Create a postgres database for the app: `heroku addons:create heroku-postgresql:mini`

Push the app to Heroku to deploy: `git push heroku main`

Migrate the database: `heroku run rake db:migrate`

Can check usage using: `heroku ps`
