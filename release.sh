#!/bin/bash

set -e

echo "🚀 Starting Clash Verge Rev Release Process..."

# 设置环境变量
export PATH="/usr/local/cargo/bin:$PATH"
VERSION=$(cat package.json | grep '"version"' | sed 's/.*"version": "\(.*\)".*/\1/')
TAG="v$VERSION"

echo "📦 Building version: $VERSION"

# 构建应用
echo "🔨 Building Tauri application..."
pnpm tauri build --bundles deb,appimage --target x86_64-unknown-linux-gnu

# 检查构建结果
BUILD_DIR="src-tauri/target/x86_64-unknown-linux-gnu/release/bundle"
echo "📂 Checking build outputs in $BUILD_DIR..."

if [ -d "$BUILD_DIR/deb" ]; then
    echo "✅ DEB packages found:"
    ls -la "$BUILD_DIR/deb/"
fi

if [ -d "$BUILD_DIR/appimage" ]; then
    echo "✅ AppImage packages found:"
    ls -la "$BUILD_DIR/appimage/"
fi

# 创建 release 目录
mkdir -p release
cp -r "$BUILD_DIR"/* release/ 2>/dev/null || true

echo "✅ Build completed! Files are in the 'release' directory."
echo "🎉 Release process completed!"
