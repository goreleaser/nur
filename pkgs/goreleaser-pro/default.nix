# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{ system ? builtins.currentSystem, pkgs, lib, fetchurl, installShellFiles }:
let
  shaMap = {
    i686-linux = "08a9v3qji5n63l1rq40hmsq69dqmhh43d3gys2qpbj2xdsi6y7pz";
    x86_64-linux = "16lldicfw8xrsdby72vsyzn33d4adwjnqqna88nnb3km9i4s9ddr";
    aarch64-linux = "1hy2sfaa793lgy7dpp15iximj4f2kd6515f5rya41p366k9ky8m3";
    x86_64-darwin = "0jjpa5agdxkpf36913l7jz9mrnr888i4jwyyf3sk062hhs9chj61";
    aarch64-darwin = "0fq06yrigqpp360b1j0ysi3br9j344404rlgx0m7fp3gyv6914hn";
  };

  urlMap = {
    i686-linux =
      "https://github.com/goreleaser/goreleaser-pro/releases/download/v1.18.2-pro/goreleaser-pro_Linux_i386.tar.gz";
    x86_64-linux =
      "https://github.com/goreleaser/goreleaser-pro/releases/download/v1.18.2-pro/goreleaser-pro_Linux_x86_64.tar.gz";
    aarch64-linux =
      "https://github.com/goreleaser/goreleaser-pro/releases/download/v1.18.2-pro/goreleaser-pro_Linux_arm64.tar.gz";
    x86_64-darwin =
      "https://github.com/goreleaser/goreleaser-pro/releases/download/v1.18.2-pro/goreleaser-pro_Darwin_x86_64.tar.gz";
    aarch64-darwin =
      "https://github.com/goreleaser/goreleaser-pro/releases/download/v1.18.2-pro/goreleaser-pro_Darwin_arm64.tar.gz";
  };
in pkgs.stdenv.mkDerivation {
  pname = "goreleaser-pro";
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

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
