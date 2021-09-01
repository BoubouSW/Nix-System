{ pkgs, ...}:

{
  nix.trustedUsers = ["root" "cgilli"];

  users = {
    users.cgilli = {
      isNormalUser = true;
      home = "/home/cgilli";
      extraGroups = ["wheel" "networkManager"];
    };
  };
} 
