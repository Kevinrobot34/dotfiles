BACKUPDIR       := $(HOME)/backups/
TARGET_DOTFILES := $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".config" -not -name ".github" -not -name ".*.swp" -not -name ".gnupg" -not -name ".vscode")

dotfiles/install: ## Installs the dotfiles.
	@for file in $(TARGET_DOTFILES); do \
		f=$$(basename $$file); \
		echo $$file $$f; \
		ln -sfn $$file $(HOME)/$$f; \
	done;
	@ln -sfn $(CURDIR)/.config/git/ignore $(HOME)/.config/git/ignore
	@exec $SHELL -l

dotfiles/list: ## list the dotfiles.
	@for file in $(TARGET_DOTFILES); do \
		echo $$file $$f; \
	done;
	@echo $(CURDIR)/.config/git/ignore

# dotfiles/backup: ## make backups of the dotfiles.
# 	@for file in $(TARGET_DOTFILES); do \
# 		echo $$file $$f; \
# 		cp $(HOME)/$$f $(BACKUPDIR)/$$f
# 	done;

code/usersettings/install:
	@ln -sfn $(CURDIR)/.vscode/settings.json $(HOME)/Library/Application\ Support/Code/User/settings.json

code/extension/list:
	@code --list-extensions > vscode-extensions.txt
	@cat vscode-extensions.txt

code/extension/install:
	@cat vscode-extensions.txt | xargs -L 1 code --install-extension