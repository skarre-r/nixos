{ ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableInteractive = true;
    enableTransience = false;
    settings = {
      add_newline = false;
      follow_symlinks = true;
      battery.disabled = true;
      cmd_duration.style = "yellow bold";
      directory = {
        style = "cyan bold";
        truncation_length = 5;
        truncate_to_repo = true;
        truncation_symbol = "../";
        read_only = "ro ";
        read_only_style = "red";
        home_symbol = "~";
        use_os_path_sep = false;
      };
      docker_context = {
        symbol = "docker ";
        style = "blue bold";
      };
      git_branch = {
        always_show_remote = true;
        format = "on [$symbol($remote_name )$branch]($style) ";
        symbol = "git ";
        style = "bold purple";
      };
      git_commit = {
        style = "green bold";
        tag_disabled = true;
        tag_symbol = " tag ";
      };
      git_state.style = "bold yellow";
      git_metrics.disabled = true;
      git_status = {
        style = "red bold";
        ahead = "⇡"; # >
        behind = "⇣"; # <
        diverged = "⇕"; # <>
        renamed = "»"; # r
        deleted = "✘"; # x
      };
      golang = {
        symbol = "go ";
        style = "bold cyan";
        not_capable_style = "bold red";
      };
      hostname = {
        ssh_only = true;
        ssh_symbol = "ssh ";
        style = "green dimmed bold";
      };
      kubernetes = {
        symbol = "k8s ";
        format = "[$symbol\[$context()\]]($style) in ";
        style = "red bold";
      };
      line_break.disabled = false;
      localip = {
        ssh_only = true;
        style = "yellow bold";
      };
      lua = {
        symbol = "lua ";
        style = "bold blue";
      };
      memory_usage.disabled = true;
      nix_shell.symbol = "nix ";
      nodejs = {
        symbol = "node ";
        style = "bold green";
      };
      os.disabled = true;
      python = {
        format = "via [$pyenv_prefix$symbol($version )(\(venv:$virtualenv\) )]($style)";
        version_format = "$major.$minor";
        symbol = "python";
        style = "yellow bold";
        pyenv_prefix = "pyenv ";
      };
      shell = {
        bash_indicator = "bash ";
        fish_indicator = "";
        zsh_indicator = "zsh ";
        nu_indicator = "nu ";
        unknown_indicator = "? ";
        format = "[$indicator]($style)";
        style = "dimmed bold";
        disabled = false;
      };
      sudo = {
        symbol = "sudo ";
        style = "bold blue";
        disabled = false;
      };
      time.disabled = true;
      username = {
        style_root = "red bold";
        style_user = "yellow bold";
        show_always = false;
      };
    };
  };
}
