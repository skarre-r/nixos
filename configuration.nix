{
  pkgs,
  ...
}:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    (builtins.attrValues (builtins.readDir ./modules))
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
    _1password = {
      enable = true;
      package = pkgs._1password-gui;
    };
    atuin = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      package = pkgs.atuin;
      settings = '''';
    };
    bat = {
      enable = true;
      package = pkgs.bat;
    };
    btop = {
      enable = true;
      package = pkgs.btop;
    };
    chromium = {
      enable = false;
      extensions = [ ];
    };
    eza = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      package = pkgs.eza;
    };
    fd = {
      enable = true;
      package = pkgs.fd;
    };
    firefox = {
      enable = true;
      package = pkgs.firefox;
      preferences = { };
    };
    fish = {
      enable = true;
      package = pkgs.fish;
      binds = { };
      functions = { };
      shellAbbrs = {
        gs = "git status -sb";
      };
      shellAliases = { };
    };
    freetube = {
      enable = true;
      package = pkgs.freetube;
      settings = { };
    };
    fzf = {
      enable = true;
      package = pkgs.fzf;
    };
    ghostty = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      package = pkgs.ghostty;
      settings = { };
    };
    git = {
      enable = true;
      package = pkgs.git;
      settings = { };
    };
    go = {
      enable = true;
      package = pkgs.go;
      telemetry.mode = "off";
    };
    helix = {
      enable = true;
      package = pkgs.helix;
      defaultEditor = false;
      settings = { };
    };
    jujutsu = {
      enable = true;
      package = pkgs.jujutsu;
      settings = { };
    };
    k9s = {
      enable = true;
      package = pkgs.k9s;
      settings = { };
      aliases = { };
    };
    lazygit = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      package = pkgs.lazygit;
      settings = { };
    };
    librewolf = {
      enable = true;
      enableGnomeExtensions = false; # TODO
      package = pkgs.librewolf;
      policies = { };
      profiles = { };
      settings = { };
    };
    nano = {
      enable = true;
      package = pkgs.nano;
      syntaxHighlight = true;
    };
    neovim = {
      enable = true;
      package = pkgs.neovim;
      defaultEditor = false;
    };
    nushell = {
      enable = true;
      package = pkgs.nushell;
      settings = { };
    };
    obsidian = {
      enable = true;
      package = pkgs.obsidian;
      defaultSettings = {
        app = { };
        appearance = { };
        communityPlugins = [ ];
        # corePlugins = [ ];
        hotkeys = { };
        themes = [ ];
      };
    };
    rclone = {
      enable = true;
      package = pkgs.rclone;
    };
    ripgrep = {
      enable = true;
      package = pkgs.ripgrep;
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      package = pkgs.starship;
      transientPrompt.enable = false;
      enableInteractive = true;
      enableTransience = false;
      interactiveOnly = true;
      settings = { };
    };
    tmux = {
      enable = true;
      package = pkgs.tmux;
    };
    uv = {
      enable = true;
      package = pkgs.uv;
      settings = { };
    };
    vim = {
      enable = true;
      package = pkgs.vim;
      defaultEditor = true;
      settings = { };
    };
    yazi = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      package = pkgs.yazi;
      settings = { };
    };
    zellij = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      package = pkgs.zellij;
      settings = { };
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
      package = pkgs.zsh;
    };
  };

  nixpkgs.config.allowUnfree = true;

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
    atuin
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
    freetube
    obsidian
    neovim
    helix
    _1password-gui
    ghostty
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
