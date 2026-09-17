#!/bin/bash
# install.sh — instala el tema Haiku-XFCE completo
set -e

THEME_DIR="$(cd "$(dirname "$0")" && pwd)/Haiku-XFCE"
DEST_THEMES="$HOME/.themes"
DEST_ICONS="$HOME/.icons"
DEST_WALLS="$HOME/.config/wallpapers"

echo "Instalando temas en $DEST_THEMES..."
mkdir -p "$DEST_THEMES"
cp -r "$THEME_DIR"/themes/* "$DEST_THEMES/"

echo "Instalando iconos en $DEST_ICONS..."
mkdir -p "$DEST_ICONS"
if [ -d "$THEME_DIR/icons" ]; then
  cp -r "$THEME_DIR"/icons/* "$DEST_ICONS/" 2>/dev/null || true
fi

echo "Instalando wallpapers en $DEST_WALLS..."
mkdir -p "$DEST_WALLS"
if [ -d "$THEME_DIR/wallpapers" ]; then
  cp -r "$THEME_DIR"/wallpapers/* "$DEST_WALLS/" 2>/dev/null || true
fi

echo "Listo. Activa el tema desde Apariencia de XFCE:"
echo "  GTK: Haiku"
echo "  WM:  Haiku-ish-Smooth"
echo "  Icons: Haiku"
