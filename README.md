# dotfiles

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
nix run home-manager/master -- init --switch
make install
home-manager switch
```
