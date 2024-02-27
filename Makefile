install:
	@stow -vS . -t ~/.config/home-manager

clean:
	@stow -vD . -t ~/.config/home-manager
