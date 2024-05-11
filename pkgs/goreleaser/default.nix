# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    i686-linux = "0han0vb6fwvh22a1g1l4ljdcp2h6agdf20kanvf8hg1ip7dkpcv1";
    x86_64-linux = "1iyzwcfkisc26p27ci7a6xmd67i5s57fck0qafia6zpv14i8ldp3";
    armv7l-linux = "0pmfqcc0zhl38lpigggl8lvh5dzqsf3nkx30mhs0cwyja1s1awdk";
    aarch64-linux = "1cmkz1hz66nsas6lfmjfbyf6rpl0b7sq1525yblpnp95v2gvfyz8";
    x86_64-darwin = "146pxvc4krral8nd58pxjamnzb1y8fkrdxkx4d2n05v8j4rmg251";
    aarch64-darwin = "10lmyp86anwxn1z6banjf7hz58yz93l3kjzhjbpzszg2n3zbfzxq";
  };

  urlMap = {
    i686-linux = "https://github.com/goreleaser/goreleaser/releases/download/v1.26.0/goreleaser_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/goreleaser/goreleaser/releases/download/v1.26.0/goreleaser_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/goreleaser/goreleaser/releases/download/v1.26.0/goreleaser_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/goreleaser/goreleaser/releases/download/v1.26.0/goreleaser_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/goreleaser/goreleaser/releases/download/v1.26.0/goreleaser_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/goreleaser/goreleaser/releases/download/v1.26.0/goreleaser_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "goreleaser";
  version = "1.26.0";
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

  meta = {
    description = "Deliver Go binaries as fast and easily as possible";
    homepage = "https://goreleaser.com";
    license = lib.licenses.mit;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv7l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
