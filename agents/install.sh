#!/bin/bash
set -e

echo "╔════════════════════════════════════════════════════════╗"
echo "║  AI Agent - 설치 스크립트                             ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

# 색상 정의
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 1. ~/.agents 복원
echo -e "${BLUE}[1/4] ~/.agents 복원...${NC}"
mkdir -p ~/.agents/skills ~/.agents/rules

if [ -d "skills" ]; then
    rsync -a skills/ ~/.agents/skills/
    echo -e "${GREEN}✓ skills 복원 완료${NC}"
else
    echo -e "${YELLOW}⚠ skills/ 디렉토리가 없습니다${NC}"
fi

if [ -d "rules" ]; then
    rsync -a rules/ ~/.agents/rules/
    echo -e "${GREEN}✓ rules 복원 완료${NC}"
else
    echo -e "${YELLOW}⚠ rules/ 디렉토리가 없습니다${NC}"
fi
echo ""

# 2. 설정 파일 복사
echo -e "${BLUE}[2/4] 설정 파일 복사...${NC}"
mkdir -p ~/.claude ~/.cursor ~/.gemini ~/.opencode

if [ -f "configs/claude-settings.local.json" ]; then
    cp configs/claude-settings.local.json ~/.claude/settings.local.json
    echo -e "${GREEN}✓ Claude 설정 복사 완료${NC}"
fi
echo ""

# 3. 에이전트 스킬 디렉토리 생성
echo -e "${BLUE}[3/4] 에이전트 스킬 디렉토리 생성...${NC}"
mkdir -p ~/.claude/skills
mkdir -p ~/.cursor/skills
mkdir -p ~/.gemini/skills
mkdir -p ~/.opencode/skills
echo -e "${GREEN}✓ 에이전트 디렉토리 생성 완료${NC}"
echo ""

# 4. 심볼릭 링크 생성
echo -e "${BLUE}[4/4] 심볼릭 링크 생성...${NC}"
for skill in ~/.agents/skills/*/; do
    skill_name=$(basename "$skill")

    # Claude
    ln -sf ~/.agents/skills/$skill_name ~/.claude/skills/$skill_name
    # Cursor
    ln -sf ~/.agents/skills/$skill_name ~/.cursor/skills/$skill_name
    # Gemini
    ln -sf ~/.agents/skills/$skill_name ~/.gemini/skills/$skill_name
    # OpenCode
    ln -sf ~/.agents/skills/$skill_name ~/.opencode/skills/$skill_name

    echo "  ✓ $skill_name → 모든 에이전트 링크 완료"
done
echo -e "${GREEN}✓ 심볼릭 링크 생성 완료${NC}"
echo ""

# 완료
echo "╔════════════════════════════════════════════════════════╗"
echo "║  ✨ 설치 완료!                                        ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "설치된 스킬:"
ls -1 ~/.agents/skills/
echo ""
echo "지원 에이전트: Claude Code, Cursor, Gemini CLI, OpenCode"
echo ""
