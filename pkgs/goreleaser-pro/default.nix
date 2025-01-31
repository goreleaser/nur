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
    i686-linux = "1dnk5ncy6gxcha7j6zjr9l51xk76hkqr95qlz1g3mbpwwvf9kip9";
    x86_64-linux = "1z67p6g582q45vmcp0a2kfhgd5xc7zp03s7d7iynas2r7acd8kzc";
    armv6l-linux = "0hhzqs7bcg6gh5xgj8ypk4lsfm915s7frirf5p8plday5nj61am8";
    aarch64-linux = "0bp717vy5m9r2aamrw9gw355lycvxgf95qzkvrv84s8hnqc00sp2";
    x86_64-darwin = "1ri27dyp6bv8n4a7vh37cj5sa7f56rkf956cljg6lfnr97d6q2y7";
    aarch64-darwin = "1rfjpsinxh1293ybi7r7052vkbfz152l0022ncdciwhi906nmr12";
  };

  urlMap = {
    i686-linux = "https://github.com/goreleaser/goreleaser-pro/releases/download/v2.6.1-pro/goreleaser-pro_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/goreleaser/goreleaser-pro/releases/download/v2.6.1-pro/goreleaser-pro_Linux_x86_64.tar.gz";
    armv6l-linux = "https://github.com/goreleaser/goreleaser-pro/releases/download/v2.6.1-pro/goreleaser-pro_Linux_armv6.tar.gz";
    aarch64-linux = "https://github.com/goreleaser/goreleaser-pro/releases/download/v2.6.1-pro/goreleaser-pro_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/goreleaser/goreleaser-pro/releases/download/v2.6.1-pro/goreleaser-pro_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/goreleaser/goreleaser-pro/releases/download/v2.6.1-pro/goreleaser-pro_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "goreleaser-pro";
  version = "2.6.1-pro";
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
    description = "Release engineering, simplified.";
    homepage = "https://goreleaser.com";
    license = lib.licenses.unfree;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

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
