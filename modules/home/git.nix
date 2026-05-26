{ ... }:

{

  programs.git = {
    enable = true;
    settings = {
      # user = {
      #   name = "skarre-r";
      #   email = "59067313+skarre-r@users.noreply.github.com";
      # };
      init.defaultBranch = "main";
    };
    includes = [
      {
        condition = "hasconfig:remote.*.url:git@github.com:*/**";
        contents = {
          user = {
            name = "skarre-r";
            email = "59067313+skarre-r@users.noreply.github.com";
          };
        };
      }
      {
        condition = "hasconfig:remote.*.url:https://github.com/**";
        contents = {
          user = {
            name = "skarre-r";
            email = "59067313+skarre-r@users.noreply.github.com";
          };
        };
      }
      {
        condition = "hasconfig:remote.*.url:git@codeberg.org:*/**";
        contents = {
          user = {
            name = "skarre-r";
            email = "skarre-r@noreply.codeberg.org";
          };
        };
      }
      {
        condition = "hasconfig:remote.*.url:https://codeberg.org/**";
        contents = {
          user = {
            name = "skarre-r";
            email = "skarre-r@noreply.codeberg.org";
          };
        };
      }
    ];
  };
}
