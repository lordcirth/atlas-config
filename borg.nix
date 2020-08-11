{ config, options, pkgs, ... }:
{
  services.openssh.knownHosts.borgbase = {
    hostNames = [ "fqf8lszq.repo.borgbase.com" "95.217.115.47" ];
    publicKey = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOstKfBbwVOYQh3J7X4nzd6/VYgLfaucP9z5n4cpSzcZAOKGh6jH8e1mhQ4YupthlsdPKyFFZ3pKo4mTaRRuiJo=";
  };

  services.borgbackup.jobs = {
    stateBackup = {
      paths = [ "/var/lib" ];
      exclude = [ "/var/lib/transmission" "/var/lib/borg" ];
      repo = "fqf8lszq@fqf8lszq.repo.borgbase.com:repo";
      compression = "auto,lzma";
      startAt = "daily";
      encryption = {
        mode = "repokey";
        passCommand = "cat /var/lib/private/borg";
      };
    };
  };
}
