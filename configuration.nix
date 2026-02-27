{
  pkgs,
  ...
}:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/system
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "thinkpad";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Oslo";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nb_NO.UTF-8";
    LC_IDENTIFICATION = "nb_NO.UTF-8";
    LC_MEASUREMENT = "nb_NO.UTF-8";
    LC_MONETARY = "nb_NO.UTF-8";
    LC_NAME = "nb_NO.UTF-8";
    LC_NUMERIC = "nb_NO.UTF-8";
    LC_PAPER = "nb_NO.UTF-8";
    LC_TELEPHONE = "nb_NO.UTF-8";
    LC_TIME = "nb_NO.UTF-8";
  };

  services.xserver = {
    enable = true;
    xkb = {
      layout = "no";
      variant = "nodeadkeys";
    };
    excludePackages = [ pkgs.xterm ];
  };

  console.keyMap = "no";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
  users.users.skar = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.fish;
    useDefaultShell = false;
  };

  # TODO: use home-manager instead?
  programs = {
    bat = {
      enable = true;
      package = pkgs.bat;
    };
    firefox = {
      enable = true;
      package = pkgs.firefox;
      preferences = { };
    };
    fish = {
      enable = true;
      package = pkgs.fish;
      shellAbbrs = {
        gs = "git status -sb";
        gl = "git --no-pager log --oneline -n 20";
        lg = "lazygit";
        add = "git add";
        pull = "git pull";
        push = "git push";
      };
    };
    git = {
      enable = true;
      package = pkgs.git;
    };
    lazygit = {
      enable = true;
      package = pkgs.lazygit;
      settings = { };
    };
    nano = {
      enable = true;
      package = pkgs.nano;
      syntaxHighlight = true;
    };
    starship = {
      enable = true;
      package = pkgs.starship;
    };
    tmux = {
      enable = true;
      package = pkgs.tmux;
    };
    vim = {
      enable = true;
      package = pkgs.vim;
      defaultEditor = true;
    };
    yazi = {
      enable = true;
      package = pkgs.yazi;
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      package = pkgs.zoxide;
    };
    zsh = {
      enable = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.homeBinInPath = true;
  environment.localBinInPath = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    just
    fzf
    curl
    btop
    bat
    bash
    docker
    docker-buildx
    docker-compose
    eza
    fd
    fish
    fastfetch
    go
    gopls
    jujutsu
    jq
    k9s
    kubectl
    kubernetes-helm
    kustomize
    lazygit
    lazyjj
    lua
    lua-language-server
    luarocks
    nushell
    opentofu
    podman
    ripgrep
    starship
    tmux
    uv
    zsh
    python314
    cilium-cli
    golangci-lint
  ];

  environment.shells = with pkgs; [
    bash
    fish
    zsh
    nushell
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.11";
}
