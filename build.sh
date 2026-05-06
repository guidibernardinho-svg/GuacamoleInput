#!/bin/bash

set -e

APP_NAME="GuacamoleInput"
ICON_PATH="assets/icon.icns"
MAIN_SCRIPT="app/main.py"
DIST_DIR="dist"
BUILD_DIR="build"

echo "🍏 Building $APP_NAME..."

# Compatibilidade com macOS 11

export MACOSX_DEPLOYMENT_TARGET=11.0

# Limpar builds antigos

echo "🧹 Cleaning old builds..."
rm -rf "$BUILD_DIR" "$DIST_DIR" *.spec

# Verificar Python

echo "🐍 Checking Python..."
python3 --version

# Instalar dependências

echo "📦 Installing dependencies..."
pip3 install --upgrade pip
pip3 install pyinstaller

# Build para arquitetura atual

echo "🔨 Building app..."
pyinstaller "$MAIN_SCRIPT" 
--name "$APP_NAME" 
--windowed 
--icon "$ICON_PATH" 
--noconfirm 
--clean

# Remover atributos de quarentena

echo "🔓 Removing macOS quarantine flags..."
xattr -cr "$DIST_DIR/$APP_NAME.app"

# Assinatura ad-hoc (evita alguns avisos)

echo "✍️ Signing app (ad-hoc)..."
codesign --deep --force --sign - "$DIST_DIR/$APP_NAME.app"

# Criar DMG

echo "💿 Creating DMG..."
hdiutil create -volname "$APP_NAME" 
-srcfolder "$DIST_DIR/$APP_NAME.app" 
-ov -format UDZO "$APP_NAME.dmg"

echo "✅ Build completo!"
echo "📦 App: $DIST_DIR/$APP_NAME.app"
echo "💿 DMG: $APP_NAME.dmg"

# Info extra

echo ""
echo "⚠️ Se o app não abrir:"
echo "1. Vá em Preferências > Segurança"
echo "2. Clique em 'Abrir mesmo assim'"
echo ""
echo "⚠️ Para capturar teclado:"
echo "Ative em: Privacidade > Acessibilidade"
