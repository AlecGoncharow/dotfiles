#!/usr/bin/env bash
LIGHT=$(light)
if [[ ${LIGHT%.*} -gt 5 ]]; then
    brightnessctl set -q 5%-
fi
