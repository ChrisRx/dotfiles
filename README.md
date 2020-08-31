# dotfiles

Use the arch gvim package even for vim so that it gets compiled with `+clipboard` and can use the system clipboard.

```
cargo install starship
```

Uses pulseaudio

Needs [oh-my-zsh](https://ohmyz.sh/) with the `zsh-autosuggestions` and `zsh-syntax-highlighting` plugins:

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
