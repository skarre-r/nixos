{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "skarre-r";
        email = "59067313+skarre-r@users.noreply.github.com";
      };
      init.defaultBranch = "main";
    };
  };
}
