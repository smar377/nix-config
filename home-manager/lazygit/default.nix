{ pkgs, ... }:
{
  programs.lazygit = {
    enable = true;
    # lazygit nix module settings
    settings = {
      git = {
        paging = {
            colorArg = "always";
            pager = "delta --dark --paging=never";
          };
      };
    };
  
  };
}
