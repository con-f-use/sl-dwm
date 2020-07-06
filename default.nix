{ pkgs ? import <nixpkgs> {} }:

pkgs.dwm.overrideDerivation (old: {
  src = ./.;
})
