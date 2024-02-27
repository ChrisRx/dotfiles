{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "chris";
  home.homeDirectory = "/home/chris";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # General
    ripgrep
    git
    sops
    (neovim.override {
      vimAlias = true;
    })
    nixpkgs-fmt
    nix-prefetch-scripts
    graph-easy
    mdbook
    tmux
    slides
    neofetch

    # Go
    go_1_21
    golangci-lint
    gotools
    go-tools
    go-task

    # Protobufs
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc

    # Cloud
    (google-cloud-sdk.withExtraComponents [
      google-cloud-sdk.components.gke-gcloud-auth-plugin
    ])
    # awscli
    awscli2
    azure-cli
    terraform

    # Kubernetes
    kubernetes-helm
    kind
    kubectl
    tilt
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/alacritty/alacritty.yml".source = files/alacritty/alacritty.yml;
    ".config/alacritty/catppuccin_macchiato.yaml".source = files/alacritty/catppuccin_macchiato.yaml;
    ".config/direnv/direnv.toml".source = files/direnv.toml;
    ".config/starship.toml".source = files/starship.toml;
    ".gitconfig".source = files/gitconfig;
    ".gitconfig-default".source = files/gitconfig-default;
    ".gitconfig-censys".source = files/gitconfig-censys;
    ".ripgreprc".source = files/ripgreprc;
    ".tmux.conf".source = files/tmux.conf;
    ".zshrc.extra".source = files/zshrc.extra;

    ".config/nvim" = {
      source = files/nvim;
      recursive = true;
    };

    ".curlrc".text = ''
    -w \n
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    RIPGREP_CONFIG_PATH = "$HOME/.ripgreprc";
    HISTSIZE = 10000;
    SAVEHIST = 10000;
  };

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    zsh = {
      enable = true;

      enableAutosuggestions = true;
      enableCompletion = true;

      completionInit = ''
      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit

      # Include hidden files in autocomplete:
      _comp_options+=(globdots)
      '';

      oh-my-zsh = {
        enable = true;
        plugins = [
          "archlinux"
          "aws"
          "colored-man-pages"
          "git"
          "history-substring-search"
          "kubectl"
          "vi-mode"
          "zsh-navigation-tools"
          "gcloud"
        ];
      };
      syntaxHighlighting = {
        enable = true;
      };
      initExtra = ''
      source $HOME/.zshrc.extra
      '';
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
    };

    eza = {
      enable = true;
      git = true;
      icons = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
