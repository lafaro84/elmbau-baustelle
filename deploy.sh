#!/bin/sh
# Haelt version.json mit APP_VERSION aus index.html synchron.
# MUSS vor jedem Commit laufen, sonst merken die Handys das Update nicht.
set -e
cd "$(dirname "$0")"
V=$(grep -o "var APP_VERSION = '[^']*'" index.html | head -1 | sed "s/.*'\(.*\)'/\1/")
[ -n "$V" ] || { echo "APP_VERSION nicht gefunden"; exit 1; }
printf '{ "version": "%s" }\n' "$V" > version.json
echo "version.json -> $V"
