#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q bibletime | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/info.bibletime.BibleTime.svg
export DESKTOP=/usr/share/applications/info.bibletime.BibleTime.desktop
export APPNAME=BibleTime
export STARTUPWMCLASS=info.bibletime.BibleTime
export DEPLOY_QT=1
export QT_DIR=qt6
export ALWAYS_SOFTWARE=1

# Deploy dependencies
quick-sharun /usr/bin/bibletime

# Turn AppDir into AppImage
quick-sharun --make-appimage
