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
    includes = {
      github = {
        condition = "hasconfig:remote.*.url:git@github.com:*";
        contents = {
          user = {
            name = "skarre-r";
            email = "59067313+skarre-r@users.noreply.github.com";
          };
        };
      };
      codeberg = {
        condition = "hasconfig:remote.*.url:git@codeberg.org:*";
        contents = {
          user = {
            name = "skarre-r";
            email = "skarre-r@noreply.codeberg.org";
          };
        };
      };
    };
  };
}
