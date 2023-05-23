# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{ system ? builtins.currentSystem, pkgs, lib, fetchurl, installShellFiles }:
let
  shaMap = {
    x86_64-linux = "047spkywhfgcibry6p16y12ynr5mxsl9r88jhqy8zxs7wdihq7l1";
    aarch64-linux = "0h5jndgv3ifvlvy2r4xjgvqyday2k9jb4h24f7n0rdqidrxgn8pg";
    x86_64-darwin = "1f80civ7i0dhnkaqpdmbynwn436fqsl6hyw34cp1airk6gnqwcwm";
    aarch64-darwin = "0girjxp07srylyq36xk1ska8p68m2fhp05xgyv4wkcl61d6rzv3y";
  };

  urlMap = {
    x86_64-linux =
      "https://github.com/goreleaser/goreleaser/releases/download/v1.18.2/goreleaser_Linux_x86_64.tar.gz";
    aarch64-linux =
      "https://github.com/goreleaser/goreleaser/releases/download/v1.18.2/goreleaser_Linux_arm64.tar.gz";
    x86_64-darwin =
      "https://github.com/goreleaser/goreleaser/releases/download/v1.18.2/goreleaser_Darwin_x86_64.tar.gz";
    aarch64-darwin =
      "https://github.com/goreleaser/goreleaser/releases/download/v1.18.2/goreleaser_Darwin_arm64.tar.gz";
  };
in pkgs.stdenv.mkDerivation {
  pname = "goreleaser";
  version = "1.18.2";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./goreleaser $out/bin/goreleaser
    installManPage ./manpages/goreleaser.1.gz
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = with lib; {
    description = "Deliver Go binaries as fast and easily as possible";
    homepage = "https://goreleaser.com";
    license = licenses.mit;

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
