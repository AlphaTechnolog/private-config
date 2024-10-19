{
  time.timeZone = "America/Caracas";

  networking = {
    hostName = "nixhost";
    networkmanager.enable = true;
    firewall.enable = false;
  };
}