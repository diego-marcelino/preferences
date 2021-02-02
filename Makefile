backup: get_current_config
	@echo Making backup
	@git checkout bkps >> /dev/null
	@git add configs/	
	@git commit -m "backup $(shell date --iso=minutes)"
	@git checkout main >> /dev/null

get_current_config:
	@cp -f ~/.vimrc configs/
