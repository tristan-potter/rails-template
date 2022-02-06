
server:
	docker-compose up

migrate:
	docker-compose run web bundle exec rails db:migrate

# I'm not sure when we run this vs db:setup
create-db:
	docker-compose run web bundle exec rails db:create


