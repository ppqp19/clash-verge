#!/bin/bash

set -e

echo "🚀 Starting Fully Automated Release Process..."

# 删除并重新创建触发标签
echo "📝 Setting up release trigger..."
git tag -d v2.3.1-auto 2>/dev/null || true
git push my-repo --delete v2.3.1-auto 2>/dev/null || true

# 创建新的触发标签
git tag -a v2.3.1-auto -m "Auto release trigger v2.3.1"
git push my-repo v2.3.1-auto

echo "✅ Release trigger pushed! GitHub Actions should start automatically."
echo "📍 Check progress at: https://github.com/ppqp19/clash-verge/actions"
echo "🎯 When complete, download from: https://github.com/ppqp19/clash-verge/releases"
