#!/bin/bash
set -e

echo "╔════════════════════════════════════════════════════════╗"
echo "║  Centell Dotfiles - 설치 스크립트                     ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# 설치 옵션 파싱
INSTALL_ALL=true
INSTALL_AGENTS=false
INSTALL_ZSH=false
INSTALL_GIT=false
INSTALL_VIM=false

if [ "$1" != "" ]; then
    INSTALL_ALL=false
    case $1 in
        --agents) INSTALL_AGENTS=true ;;
        --zsh) INSTALL_ZSH=true ;;
        --git) INSTALL_GIT=true ;;
        --vim) INSTALL_VIM=true ;;
        --all) INSTALL_ALL=true ;;
        *)
            echo "Usage: $0 [--agents|--zsh|--git|--vim|--all]"
            exit 1
            ;;
    esac
fi

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# AI Agents 설치
if [ "$INSTALL_ALL" = true ] || [ "$INSTALL_AGENTS" = true ]; then
    echo -e "${BLUE}[1/4] AI Agents 설치...${NC}"
    if [ -f "$DOTFILES_DIR/agents/install.sh" ]; then
        cd "$DOTFILES_DIR/agents"
        ./install.sh
        echo -e "${GREEN}✓ AI Agents 설치 완료${NC}"
    else
        echo -e "${YELLOW}⚠ agents/install.sh 없음${NC}"
    fi
    echo ""
fi

# Zsh 설치
if [ "$INSTALL_ALL" = true ] || [ "$INSTALL_ZSH" = true ]; then
    echo -e "${BLUE}[2/4] Zsh 설정...${NC}"
    if [ -f "$DOTFILES_DIR/zsh/.zshrc" ]; then
        ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
        echo -e "${GREEN}✓ .zshrc 링크 생성${NC}"
    else
        echo -e "${YELLOW}⚠ zsh/.zshrc 없음 (나중에 추가)${NC}"
    fi
    echo ""
fi

# Git 설치
if [ "$INSTALL_ALL" = true ] || [ "$INSTALL_GIT" = true ]; then
    echo -e "${BLUE}[3/4] Git 설정...${NC}"
    if [ -f "$DOTFILES_DIR/git/.gitconfig" ]; then
        ln -sf "$DOTFILES_DIR/git/.gitconfig" ~/.gitconfig
        echo -e "${GREEN}✓ .gitconfig 링크 생성${NC}"
    else
        echo -e "${YELLOW}⚠ git/.gitconfig 없음 (나중에 추가)${NC}"
    fi

    if [ -f "$DOTFILES_DIR/git/.gitignore_global" ]; then
        ln -sf "$DOTFILES_DIR/git/.gitignore_global" ~/.gitignore_global
        echo -e "${GREEN}✓ .gitignore_global 링크 생성${NC}"
    fi
    echo ""
fi

# Vim 설치
if [ "$INSTALL_ALL" = true ] || [ "$INSTALL_VIM" = true ]; then
    echo -e "${BLUE}[4/4] Vim 설정...${NC}"
    if [ -f "$DOTFILES_DIR/vim/.vimrc" ]; then
        ln -sf "$DOTFILES_DIR/vim/.vimrc" ~/.vimrc
        echo -e "${GREEN}✓ .vimrc 링크 생성${NC}"
    else
        echo -e "${YELLOW}⚠ vim/.vimrc 없음 (나중에 추가)${NC}"
    fi
    echo ""
fi

echo "╔════════════════════════════════════════════════════════╗"
echo "║  ✨ 설치 완료!                                        ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "설치된 항목:"
[ "$INSTALL_ALL" = true ] || [ "$INSTALL_AGENTS" = true ] && echo "  ✓ AI Agents"
[ "$INSTALL_ALL" = true ] || [ "$INSTALL_ZSH" = true ] && echo "  ✓ Zsh"
[ "$INSTALL_ALL" = true ] || [ "$INSTALL_GIT" = true ] && echo "  ✓ Git"
[ "$INSTALL_ALL" = true ] || [ "$INSTALL_VIM" = true ] && echo "  ✓ Vim"
echo ""
