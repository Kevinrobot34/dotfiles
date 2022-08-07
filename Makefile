BACKUPDIR       := $(HOME)/backups/
TARGET_DOTFILES := $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".config" -not -name ".github" -not -name ".*.swp" -not -name ".gnupg")

dotfiles/install: ## Installs the dotfiles.
	# add aliases for dotfiles
	@for file in $(TARGET_DOTFILES); do \
		f=$$(basename $$file); \
		echo $$file $$f; \
		ln -sfn $$file $(HOME)/$$f; \
	done;

dotfiles/list: ## list the dotfiles.
	# add aliases for dotfiles
	@for file in $(TARGET_DOTFILES); do \
		echo $$file $$f; \
	done;

# dotfiles/backup: ## make backups of the dotfiles.
# 	# add aliases for dotfiles
# 	@for file in $(TARGET_DOTFILES); do \
# 		echo $$file $$f; \
# 		cp $(HOME)/$$f $(BACKUPDIR)/$$f
# 	done;

code/extension/list:
	@code --list-extensions > vscode-extensions.txt
	@cat vscode-extensions.txt

code/extension/install:
	@cat vscode-extensions.list | xargs -L 1 code --install-extension