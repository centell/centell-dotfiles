#!/bin/bash
set -e

echo "╔════════════════════════════════════════════════════════╗"
echo "║  AI Agent - 백업 스크립트                             ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# 1. ~/.agents 내용 백업
echo -e "${BLUE}[1/2] ~/.agents 백업...${NC}"
if [ -d ~/.agents ]; then
    # skills 백업
    if [ -d ~/.agents/skills ]; then
        mkdir -p skills
        rsync -a --delete ~/.agents/skills/ skills/
        echo -e "${GREEN}✓ skills 백업 완료${NC}"
    fi
    # rules 백업
    if [ -d ~/.agents/rules ]; then
        mkdir -p rules
        rsync -a --delete ~/.agents/rules/ rules/
        echo -e "${GREEN}✓ rules 백업 완료${NC}"
    fi
    echo "  백업된 항목:"
    ls -1d skills rules 2>/dev/null | sed 's/^/    - /'
else
    echo "⚠ ~/.agents/ 가 없습니다"
fi
echo ""

# 2. 설정 파일 백업
echo -e "${BLUE}[2/2] 설정 파일 백업...${NC}"
mkdir -p configs

if [ -f ~/.claude/settings.local.json ]; then
    cp ~/.claude/settings.local.json configs/claude-settings.local.json
    echo -e "${GREEN}✓ Claude 설정 백업 완료${NC}"
fi

if [ -f ~/.cursor/settings.json ]; then
    cp ~/.cursor/settings.json configs/cursor-settings.json
    echo -e "${GREEN}✓ Cursor 설정 백업 완료${NC}"
fi

if [ -f ~/.gemini/settings.json ]; then
    cp ~/.gemini/settings.json configs/gemini-settings.json
    echo -e "${GREEN}✓ Gemini 설정 백업 완료${NC}"
fi
echo ""

# 완료
echo "╔════════════════════════════════════════════════════════╗"
echo "║  ✨ 백업 완료!                                        ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "백업된 파일:"
echo "  - skills/   (~/.agents/skills)"
echo "  - rules/    (~/.agents/rules)"
echo "  - configs/"
echo ""
echo "Git 커밋 추천:"
echo "  git add ."
echo "  git commit -m 'Update AI agent backup'"
echo "  git push"
echo ""
