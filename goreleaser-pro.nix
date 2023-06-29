# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{ system ? builtins.currentSystem, pkgs, lib, fetchurl, installShellFiles }:
let
  shaMap = {
    i686-linux = "17smbqcxsp19kly109881x0fl3yj54dvbrpina3m1gnl9mkiphh3";
    x86_64-linux = "195kqp6qv57dbb3g84lr4hwv9zxrj1fdwc5380sx06i8m7a5kb5q";
    armv6l-linux = "0zbibj19nzdny92bapbzadcrw29n6frzhma65nh10lx5j9ns7grv";
    aarch64-linux = "07iq6jpbp01y813ik83lb3s5pyhsz1n1z5qxgb3mzwrhbqz1wam4";
    x86_64-darwin = "1m71s1pdq0ijipnyr4j2z8vznakv0x4vvml754cpm40iv00gmacf";
    aarch64-darwin = "13zld10h93r1x1pa6a0nzcqf88z73q635n09pva1qnszm2p9yn7a";
  };

  urlMap = {
    i686-linux = "https://github.com/goreleaser/goreleaser-pro/releases/download/v1.19.0-pro/goreleaser-pro_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/goreleaser/goreleaser-pro/releases/download/v1.19.0-pro/goreleaser-pro_Linux_x86_64.tar.gz";
    armv6l-linux = "https://github.com/goreleaser/goreleaser-pro/releases/download/v1.19.0-pro/goreleaser-pro_Linux_armv6.tar.gz";
    aarch64-linux = "https://github.com/goreleaser/goreleaser-pro/releases/download/v1.19.0-pro/goreleaser-pro_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/goreleaser/goreleaser-pro/releases/download/v1.19.0-pro/goreleaser-pro_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/goreleaser/goreleaser-pro/releases/download/v1.19.0-pro/goreleaser-pro_Darwin_arm64.tar.gz";
  };
in pkgs.stdenv.mkDerivation {
  pname = "goreleaser-pro";
  version = "1.19.0-pro";
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
    license = licenses.unfree;

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv6l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
