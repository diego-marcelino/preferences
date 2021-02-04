backup: get_current_config
	@echo Making backup
	@git checkout bkps >> /dev/null
	@git add configs/	
	@git commit -m "backup $(shell date --iso=minutes)"
	@git push
	@git checkout main >> /dev/null

get_current_config:
	@cp -f ~/.vimrc configs/
	@cp -f ~/.oh-my-zsh/themes/diego-ubuntu.zsh-theme configs/
	@./gnome-terminal-profile.sh export configs/terminal.profile

