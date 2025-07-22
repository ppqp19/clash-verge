#!/bin/bash

set -e

echo "🚀 Starting Fresh Build and Release..."

# 获取当前时间戳作为版本标识
TIMESTAMP=$(date +"%Y%m%d-%H%M")
NEW_TAG="v2.3.1-build-${TIMESTAMP}"

echo "📦 Creating new release: $NEW_TAG"

# 删除旧的构建缓存
echo "🧹 Cleaning old build cache..."
rm -rf src-tauri/target/release/bundle/ 2>/dev/null || true

# 创建新的发布标签
echo "📝 Creating fresh release tag..."
git tag -a "$NEW_TAG" -m "Fresh build and release $NEW_TAG"
git push my-repo "$NEW_TAG"

echo "✅ Fresh release trigger pushed!"
echo "📍 Check progress at: https://github.com/ppqp19/clash-verge/actions"
echo "🏷️ Release tag: $NEW_TAG"
echo "🎯 When complete, download from: https://github.com/ppqp19/clash-verge/releases"
