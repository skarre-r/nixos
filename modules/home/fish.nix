{...}:

{
  programs.fish = {
    enable = true;
    preferAbbrs = true;
    functions = {
      whoami = {
        body = "/run/current-system/sw/bin/whoami; echo \"$(git config user.name) ($(git config user.email))\"";
      };
    };
  };
}
