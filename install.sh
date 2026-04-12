#!/usr/bin/env bash
# Mythos Claude Code Skill — Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/filipdopita-tech/mythos-skill/main/install.sh | bash

set -e

SKILL_DIR="$HOME/.claude/skills/mythos"
REPO="https://github.com/filipdopita-tech/mythos-skill"
RAW="https://raw.githubusercontent.com/filipdopita-tech/mythos-skill/main"

echo ""
echo "⚡ Installing Mythos Claude Code Skill"
echo "---------------------------------------"

# Check for Claude Code
if ! command -v claude &>/dev/null; then
  echo "❌ Claude Code CLI not found."
  echo "   Install it from: https://claude.ai/code"
  exit 1
fi

# Create skills directory
mkdir -p "$(dirname "$SKILL_DIR")"

# Install via git if available, otherwise curl
if command -v git &>/dev/null; then
  if [ -d "$SKILL_DIR/.git" ]; then
    echo "→ Updating existing install..."
    git -C "$SKILL_DIR" pull --quiet
  else
    echo "→ Cloning from GitHub..."
    git clone --quiet "$REPO" "$SKILL_DIR"
  fi
else
  echo "→ Downloading SKILL.md (no git found)..."
  mkdir -p "$SKILL_DIR"
  curl -fsSL "$RAW/SKILL.md" -o "$SKILL_DIR/SKILL.md"
fi

echo ""
echo "✓ Installed to: $SKILL_DIR"
echo ""
echo "Usage:"
echo "  /mythos security ./api        — vulnerability hunt"
echo "  /mythos debug \"segfault\"      — root cause analysis"
echo "  /mythos audit ./src           — code audit with evidence"
echo "  /mythos deep \"why is X slow\"  — deep chain reasoning"
echo ""
echo "Note: Mythos always uses claude-opus-4-6. Each task costs ~\$0.20–\$2.00."
echo ""
