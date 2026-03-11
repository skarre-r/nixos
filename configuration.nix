{
  pkgs,
  ...
}:
let
  packages = with pkgs; [
    wget
    just
    fzf
    curl
    btop
    docker
    docker-buildx
    docker-compose
    eza
    fd
    fastfetch
    go # TODO: (re)move?
    gopls # TODO: (re)move?
    golangci-lint
    jujutsu
    jq
    k9s
    kubectl
    kubernetes-helm
    kustomize
    lua
    lua-language-server
    luarocks
    opentofu
    podman
    ripgrep
    uv
    python314
    cilium-cli
    nil
    nixd
    nixfmt-rfc-style
    fprintd # TODO
    alejandra
    tree-sitter
  ];
in
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

  console.keyMap = "no";

  security.rtkit.enable = true;
  security.sudo.enable = true;

  services.xserver = {
    enable = true;
    xkb = {
      layout = "no";
      variant = "nodeadkeys";
    };
    excludePackages = [ pkgs.xterm ];
  };
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.fprintd = {
    enable = true;
    package = pkgs.fprintd-tod;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix-550a;
    };
  };
  services.thinkfan.enable = false; # TODO
  services.tlp = {
    enable = true; # TODO: + tlpui
    settings = {
      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };
  services.auto-cpufreq = {
    enable = false; # TODO
    settings = { };
  };
  services.tuned = {
    enable = false;
  };
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchDocked = "ignore";
    HandleLidSwitchExternalPower = "lock";
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

  programs.bat.enable = true;
  programs.firefox.enable = false;
  programs.git.enable = true;
  programs.lazygit.enable = false;
  programs.nano.enable = true;
  programs.starship.enable = false;
  programs.tmux.enable = true;
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
  programs.zoxide.enable = true;
  programs.zsh.enable = true;
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 3 --keep-since 3d";
    };
    flake = null; # TODO: repo path
  };

  environment.homeBinInPath = true;
  environment.localBinInPath = true;
  environment.systemPackages = packages;
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

  nix.enable = true;
  nix.gc.automatic = false;
  nix.optimise.automatic = true;
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    download-buffer-size = 524288000; # 500 MiB
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
  system.autoUpgrade.enable = false; # TODO?

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=10m
  '';

  powerManagement = {
    enable = true;
    powertop = {
      enable = true;
    };
  };

  documentation = {
    enable = true;
    nixos.enable = false;
  };
}
