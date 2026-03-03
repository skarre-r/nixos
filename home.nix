{ pkgs, ... }:
let
  packages = with pkgs; [
    _1password-gui
    sublime
    bruno
    libreoffice
    gh
    plex-desktop
    signal-desktop
    telegram-desktop
    slack
  ];
in
{
  imports = [
    ./modules/home
  ];

  home.stateVersion = "25.11";
  home.username = "skar";
  home.homeDirectory = "/home/skar";
  home.packages = packages;

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      auto_sync = false;
      search_mode = "fuzzy";
      filter_mode = "global";
      style = "auto";
      inline_height = 10;
      invert = false;
      show_preview = true;
      exit_mode = "return-query";
      show_help = false;
      show_tabs = false;
      enter_accept = false;
      keymap_mode = "auto";
      prefers_reduced_motion = true;
    };
  };
  programs.bash.enable = true;
  programs.bat.enable = true;
  programs.btop.enable = true;
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
  };
  programs.eza = {
    enable = true;
    enableFishIntegration = false; # TODO
  };
  programs.fastfetch.enable = true;
  programs.fd.enable = true;
  programs.firefox.enable = false;
  programs.fish = {
    enable = true; # TODO
    preferAbbrs = true;
  };
  programs.freetube.enable = true;
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.gh.enable = true;
  programs.go = {
    enable = true;
    telemetry.mode = "off";
  };
  programs.grep.enable = true;
  programs.helix.enable = true;
  programs.jq.enable = true;
  programs.jujutsu.enable = true;
  programs.k9s.enable = true;
  programs.lazygit = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      gui = {
        mouseEvents = true;
        language = "en";
        showRandomTip = false;
        nerdFontsVersion = "3";
        showFileIcons = true;
      };
      git = {
        autoFetch = false;
      };
      update = {
        method = "never";
      };
      confirmOnQuit = false;
      quitOnTopLevelReturn = true;
      disableStartupPopups = true;
      notARepository = "quit";
    };
  };
  programs.man.enable = true;
  programs.mpv.enable = true;
  programs.nushell.enable = true;
  programs.obsidian.enable = true;
  programs.ripgrep.enable = true;
  # programs.ssh.enable = true;
  programs.tmux.enable = true;
  programs.uv.enable = true;
  # TODO: move config to configuration.nix?
  programs.vim = {
    enable = true;
    defaultEditor = true;
    settings = {
      background = "dark";
      number = true;
      relativenumber = false;
      ignorecase = true;
      smartcase = true;
    };
    extraConfig = ''
      filetype on
      filetype plugin on
      filetype indent on
      syntax on
      set cursorline
      set shiftwidth=4
      set tabstop=4
      set expandtab
      set nobackup
      set scrolloff=10
      set nowrap
      set incsearch
      set showcmd
      set showmode
      set showmatch
      set hlsearch
      set history=1000
      set wildmenu
      set wildmode=list:longest
      set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
    '';
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.yt-dlp.enable = true;
  programs.zellij = {
    enable = false; # TODO
    enableFishIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.zsh.enable = true;

  xdg.enable = true;

  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    hinting = "slight"; # null | "none" | "slight" | "medium" | "full"
    subpixelRendering = "rgb"; # null | "none" | "rgb" | "bgr" | "vertical-rgb" | "vertical-bgr"
  };
}
