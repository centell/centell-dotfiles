#!/bin/bash
set -e

echo "╔════════════════════════════════════════════════════════╗"
echo "║  Centell Dotfiles - 백업 스크립트                     ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# AI Agents 백업
echo -e "${BLUE}[1/4] AI Agents 백업...${NC}"
if [ -f "$DOTFILES_DIR/agents/backup.sh" ]; then
    cd "$DOTFILES_DIR/agents"
    ./backup.sh
    echo -e "${GREEN}✓ AI Agents 백업 완료${NC}"
fi
echo ""

# Zsh 백업
echo -e "${BLUE}[2/4] Zsh 백업...${NC}"
if [ -f ~/.zshrc ]; then
    cp ~/.zshrc "$DOTFILES_DIR/zsh/.zshrc"
    echo -e "${GREEN}✓ .zshrc 백업 완료${NC}"
fi
echo ""

# Git 백업
echo -e "${BLUE}[3/4] Git 백업...${NC}"
if [ -f ~/.gitconfig ]; then
    cp ~/.gitconfig "$DOTFILES_DIR/git/.gitconfig"
    echo -e "${GREEN}✓ .gitconfig 백업 완료${NC}"
fi
if [ -f ~/.gitignore_global ]; then
    cp ~/.gitignore_global "$DOTFILES_DIR/git/.gitignore_global"
    echo -e "${GREEN}✓ .gitignore_global 백업 완료${NC}"
fi
echo ""

# Vim 백업
echo -e "${BLUE}[4/4] Vim 백업...${NC}"
if [ -f ~/.vimrc ]; then
    cp ~/.vimrc "$DOTFILES_DIR/vim/.vimrc"
    echo -e "${GREEN}✓ .vimrc 백업 완료${NC}"
fi
echo ""

echo "╔════════════════════════════════════════════════════════╗"
echo "║  ✨ 백업 완료!                                        ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "백업된 파일:"
echo "  - agents/"
echo "  - zsh/.zshrc"
echo "  - git/.gitconfig"
echo "  - vim/.vimrc"
echo ""
echo "Git 커밋 추천:"
echo "  cd $DOTFILES_DIR"
echo "  git add ."
echo "  git commit -m 'Update dotfiles'"
echo "  git push"
echo ""
