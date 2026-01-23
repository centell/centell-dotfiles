# Centell Dotfiles

개인 개발 환경 설정 백업 및 동기화

## 📦 포함된 설정

### 🤖 AI Agents
- Claude Code, Cursor, Gemini CLI, OpenCode
- 글로벌 스킬: workflow-templates
- 설정 파일: settings.local.json

### 🐚 Zsh
- .zshrc
- 플러그인 설정
- 테마 설정

### 📝 Git
- .gitconfig
- .gitignore_global
- Git aliases

### ✏️  Vim
- .vimrc
- 플러그인 설정

### 💻 VSCode (선택)
- settings.json
- keybindings.json
- 확장 프로그램 목록

## 🚀 빠른 시작

### 새 장비에 설치

```bash
# 저장소 클론
git clone https://github.com/YOUR_USERNAME/centell-dotfiles.git ~/centell-dotfiles

# 전체 설치
cd ~/centell-dotfiles
./install.sh

# 또는 선택적 설치
./install.sh --agents    # AI 에이전트만
./install.sh --zsh       # Zsh만
./install.sh --git       # Git만
```

### 현재 장비 백업

```bash
cd ~/centell-dotfiles
./backup.sh

# Git 커밋
git add .
git commit -m "Update dotfiles"
git push
```

## 📂 구조

```
centell-dotfiles/
├── agents/              # AI 에이전트 설정
│   ├── global-skills/   # 글로벌 스킬
│   ├── configs/         # 설정 파일
│   ├── install.sh       # 에이전트 설치
│   └── backup.sh        # 에이전트 백업
├── zsh/                 # Zsh 설정
│   └── .zshrc
├── git/                 # Git 설정
│   ├── .gitconfig
│   └── .gitignore_global
├── vim/                 # Vim 설정
│   └── .vimrc
├── vscode/              # VSCode 설정 (선택)
│   ├── settings.json
│   └── extensions.txt
├── install.sh           # 전체 설치 스크립트
├── backup.sh            # 전체 백업 스크립트
└── README.md            # 이 파일
```

## 🎯 사용 시나리오

### 시나리오 1: 새 MacBook 구매
```bash
git clone https://github.com/YOUR_USERNAME/centell-dotfiles.git ~/centell-dotfiles
cd ~/centell-dotfiles
./install.sh
# 5분 안에 모든 설정 완료!
```

### 시나리오 2: 설정 변경 후 백업
```bash
# Zsh 설정 수정
vim ~/.zshrc

# 백업
cd ~/centell-dotfiles
./backup.sh
git add . && git commit -m "Update zsh aliases" && git push
```

### 시나리오 3: 다른 장비와 동기화
```bash
cd ~/centell-dotfiles
git pull
./install.sh
```

## 🔧 커스터마이징

각 설정은 독립적으로 관리됩니다. 필요한 부분만 선택적으로 사용 가능합니다.

## 📝 라이선스

개인 사용

## 👤 작성자

Centell Development Team
