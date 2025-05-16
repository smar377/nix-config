{
  inputs,
  lib,
  system,
  pkgs,
  ...
}: 

{
  # Import other home-manager modules here
  imports = [
    ./lazygit
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  xdg.enable = true;

  
  home.packages = with pkgs; [
    # Development Tools and Languages
    devbox

    # Network Tools
    dogdns
    htop
    mtr
    sshuttle
    wget
    wireguard-tools

    # Cloud and Infrastructure
    ansible
    ansible-lint
    unstable.awscli2
    docker-compose
    kubectl
    terraform
    tflint
}
