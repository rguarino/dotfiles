.Phony: pall update vim tmux zsh ssh emacsp
.IGNORE: vim tmux zsh ssh emacs

all: vim tmux zsh ssh emacs
	@echo "Finised configuration"

vim: vimcheck viminstall
	@echo "Configuring vim"
	unlink $(HOME)/.vimrc.local
	ln -s $(HOME)/dotfiles/vim/vimrc.local $(HOME)/.vimrc.local

tmux: tmuxcheck
	@echo "Configuring tmux"
	unlink $(HOME)/.tmux.conf
	ln -s $(HOME)/dotfiles/tmux/tmux.conf $(HOME)/.tmux.conf

zsh: zshcheck zshinstall
	@echo "Configuring zsh"
	unlink $(HOME)/.oh-my-zsh/custom/override.zsh
	ln -s $(HOME)/dotfiles/zsh/override.zsh $(HOME)/.oh-my-zsh/custom/override.zsh

ssh: sshcheck
	@echo "Configuring ssh"
	unlink $(HOME)/.ssh/config
	ln -s $(HOME)/dotfiles/ssh/ssh.conf $(HOME)/.ssh/config

emacs: emacscheck
	@echo "Configuring emacs"
	unlink $(HOME)/.emacs
	ln -s $(HOME)/dotfiles/emacs/emacsnnn $(HOME)/.emacs

zshinstall:
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
	@touch zshinstall

viminstall:
	rm spf13-vim.sh
	curl http://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
	@touch viminstall

.Phony: vimcheck tmuxcheck zshcheck emacscheck
vimcheck:
	$(HOME)/dotfiles/install/vim

tmuxcheck:
	$(HOME)/dotfiles/install/tmux

zshcheck:
	$(HOME)/dotfiles/install/zsh

emacscheck:
	$(HOME)/dotfiles/install/emacs

sshcheck:
	$(HOME)/dotfiles/install/ssh
