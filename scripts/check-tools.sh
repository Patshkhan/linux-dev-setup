#!/usr/bin/env bash
set -eu

# Presence checks only: no configuration, environment, credentials or logs.
for tool in git gh node npm python docker; do
  if command -v "$tool" >/dev/null 2>&1; then
    printf '%-8s available\n' "$tool"
  else
    printf '%-8s missing\n' "$tool"
  fi
done
