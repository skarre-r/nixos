{ ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      # zoxide
      cd = "z";
      # eza
      ls = "eza -l";
      lsa = "eza -la";
      # bat
      cat = "bat --paging=never";
      # git
      gs = "git status -sb";
      gl = "git --no-pager log --oneline -n 20";
      glog = "git log --oneline";
      gif = "git --no-pager diff";
      gifs = "git --no-pager diff --staged";
      gb = "git --no-pager branch";
      gbd = "git brancg -D";
      grv = "git remote -v";
      gfp = "git fetch --prune";
      add = "git add";
      cmt = "git commit -m";
      pull = "git pull";
      push = "git push";
      amend = "git commit --amend";
      checkout = "git switch";
      discard = "git restore";
      # lazygit
      lg = "lazygit";
      # fastfetch
      ff = "fastfetch";
    };
  };
}
