{ pkgs, system }:

if (system == "x86_64-linux")
  then pkgs.fetchurl {
    url = "https://www.princexml.com/download/prince-15.1-linux-generic-x86_64.tar.gz";
    sha256 = "sha256-rm0GeKPa8iDXBhW52GNcja09Qb+aYUtvFaxZUFHEOTw=";
  }

# The mac version probably does not work.
# I am also not sure if aarch64 is supported.
else if (system == "x86_64-darwin")
  then pkgs.fetchurl {
    url = "https://www.princexml.com/download/prince-15.1-macos.zip";
    sha256 = "TODO-UPDATE-SHA";
  }

else if (system == "x86_64-freebsd13")
  then pkgs.fetchurl {
    url = "https://www.princexml.com/download/prince-15.1-freebsd-13.0-amd64.tar.gz";
    sha256 = "TODO-UPDATE-SHA";
  }

else abort "Unsupported system"
