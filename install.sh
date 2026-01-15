#!/bin/bash

REPO_URL="https://raw.githubusercontent.com/TUAN130294/awf/main/workflows"
TARGET_DIR=".agent/workflows"
WORKFLOWS=(
    "plan.md" "code.md" "visualize.md" "deploy.md" 
    "debug.md" "refactor.md" "test.md" "run.md" 
    "init.md" "recap.md" "rollback.md" "save_brain.md" 
    "audit.md" "cloudflare-tunnel.md"
)

echo "🚀 Đang cài đặt Antigravity Workflow Framework (AWF)..."

mkdir -p "$TARGET_DIR"

for wf in "${WORKFLOWS[@]}"; do
    if curl -f -s -o "$TARGET_DIR/$wf" "$REPO_URL/$wf"; then
        echo "✅ Đã tải: $wf"
    else
        echo "❌ Lỗi tải: $wf"
    fi
done

echo ""
echo "🎉 Cài đặt hoàn tất! Gõ '/' để bắt đầu."
