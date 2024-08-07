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
    x86_64-linux = "038pfphi603sfyivb7drzgjz2id8jbp7jgsv8g4cyci8xs9vxvnr";
    aarch64-linux = "09sv2mxf66plaavcbmqrma63i27v56m5cncl0spzdj6phvayhfz6";
    x86_64-darwin = "0az39ji2a75ja5r4zbxa8vavl0qs3cn2ffzy6yj89gfnivqj053q";
    aarch64-darwin = "08bqkzzqzfdkd9ln52a8yn8w2rdvglc2xxgrl2qmdw3cd4qqhy28";
  };

  urlMap = {
    x86_64-linux = "https://github.com/goreleaser/nfpm/releases/download/v2.38.0/nfpm_2.38.0_Linux_x86_64.tar.gz";
    aarch64-linux = "https://github.com/goreleaser/nfpm/releases/download/v2.38.0/nfpm_2.38.0_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/goreleaser/nfpm/releases/download/v2.38.0/nfpm_2.38.0_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/goreleaser/nfpm/releases/download/v2.38.0/nfpm_2.38.0_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "nfpm";
  version = "2.38.0";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./nfpm $out/bin/nfpm
    installManPage ./manpages/nfpm.1.gz
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = {
    description = "nFPM is a simple, 0-dependencies, deb, rpm and apk packager.";
    homepage = "https://nfpm.goreleaser.com";
    license = lib.licenses.mit;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
