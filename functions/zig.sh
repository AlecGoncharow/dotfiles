#!/usr/bin/env bash
zb () {
 zig build "$@"
}

zbs() {
 zig build "$@" --summary all
}

zt () {
 zig build test "$@"
}

zts() {
 zig build test "$@" --summary all
}

zr () {
 zig build run "$@"
}

zrf () {
 zig build run -Doptimize=ReleaseFast "$@"
}

zrfs () {
 zig build run -Doptimize=ReleaseFast --summary all "$@"
}

zrs() {
 zig build run "$@" --summary all
}
