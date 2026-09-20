#!/usr/bin/env bash
# ==============================================================================
# Anime Character Sheet Architect - macOS / Linux 一鍵安裝腳本
# 適用環境: Antigravity / Gemini CLI / Claude Code / Cursor
# ==============================================================================

set -e

echo "=========================================================="
echo "  🎨 Anime Character Sheet Architect Installer (macOS/Linux)"
echo "=========================================================="

DEST_BASE="$HOME/.gemini/config/skills"

# 支援參數設定
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --workspace) DEST_BASE="$(pwd)/.agents/skills" ;;
        --claude) DEST_BASE="$HOME/.claude/skills" ;;
        --target) DEST_BASE="$2"; shift ;;
        *) echo "未知參數: $1"; exit 1 ;;
    esac
    shift
done

echo "[1/3] 目標安裝位置: $DEST_BASE"
mkdir -p "$DEST_BASE"

SKILL="anime-character-sheet-architect"
TARGET="$DEST_BASE/$SKILL"

if [ -d "$TARGET" ]; then
    echo "  -> 覆蓋更新既有版本: $SKILL..."
    rm -rf "$TARGET"
fi
mkdir -p "$TARGET"

echo "[2/3] 正在安裝技能模組..."

INSTALLED=false
if [ -n "${BASH_SOURCE[0]}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    if [ -f "$SCRIPT_DIR/SKILL.md" ]; then
        cp "$SCRIPT_DIR/SKILL.md" "$TARGET/SKILL.md"
        INSTALLED=true
        echo "  ✓ 從本機來源安裝: $SCRIPT_DIR/SKILL.md"
    elif [ -f "$SCRIPT_DIR/$SKILL/SKILL.md" ]; then
        cp "$SCRIPT_DIR/$SKILL/SKILL.md" "$TARGET/SKILL.md"
        INSTALLED=true
        echo "  ✓ 從本機來源安裝: $SCRIPT_DIR/$SKILL/SKILL.md"
    fi
fi

if [ "$INSTALLED" = false ]; then
    RAW_URL="https://raw.githubusercontent.com/JeffreyHo0520/anime-character-sheet-architect/main/SKILL.md"
    echo "  -> 正在從 GitHub 遠端下載最新技能定義: $RAW_URL"
    curl -fsSL "$RAW_URL" -o "$TARGET/SKILL.md"
    echo "  ✓ 下載並安裝成功！"
fi

echo "[3/3] 驗證安裝結果..."
if [ -f "$TARGET/SKILL.md" ]; then
    echo "  ✓ 驗證通過: $TARGET/SKILL.md"
    echo "=========================================================="
    echo "🎉 恭喜！anime-character-sheet-architect 技能已成功安裝！"
    echo ""
    echo "💡 如何使用 (在 Antigravity / Claude Code 對話中)："
    echo "  1. 輸入斜線指令："
    echo "     /anime-character-sheet-architect"
    echo "  2. 或使用自然語言："
    echo "     「我要創造一個虛擬角色，是《七龍珠Z》布馬，請給我這個角色的角色設定圖」"
    echo "     「幫我製作 [角色名稱] 的角色三視圖與表情矩陣設定集」"
    echo "=========================================================="
else
    echo "❌ 驗證失敗: 找不到 $TARGET/SKILL.md"
    exit 1
fi
