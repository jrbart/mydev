dock:
	open -a /Applications/Docker.app/Contents/MacOS/Docker

start:
	docker-compose start

stop:
	docker-compose stop

nvim:
	docker-compose exec neovim zsh

