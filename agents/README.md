# AI Agent Skills Configuration

개인 AI 에이전트 설정 및 스킬 백업

## 📦 구조

```
agent-skills/
├── global-skills/           # 글로벌 스킬 (모든 프로젝트 공통)
│   └── workflow-templates/  # 계획/완료 보고, 커밋 템플릿
├── configs/                 # 에이전트 설정 파일
│   ├── claude-settings.local.json
│   └── (기타 설정)
├── install.sh              # 설치 스크립트
└── README.md               # 이 파일
```

## 🚀 새 장비에 설치

### 자동 설치 (추천)

```bash
cd ~/dotfiles/agent-skills
./install.sh
```

### 수동 설치

```bash
# 1. 글로벌 스킬 복사
mkdir -p ~/.agents/skills
cp -r global-skills/* ~/.agents/skills/

# 2. 설정 파일 복사
mkdir -p ~/.claude
cp configs/claude-settings.local.json ~/.claude/settings.local.json

# 3. 심볼릭 링크 생성
./create-links.sh
```

## 📝 백업 업데이트

```bash
# 현재 설정을 dotfiles에 백업
./backup.sh
```

## 🌍 포함된 스킬

### 글로벌 스킬
- **workflow-templates**: 계획 보고, 완료 보고, 커밋 메시지 템플릿

## 🔧 지원 에이전트

- ✅ Claude Code
- ✅ Cursor
- ✅ Gemini CLI
- ✅ OpenCode

## 📌 노트

- 프로젝트별 스킬은 각 프로젝트의 `.agents/skills/`에 저장
- 글로벌 스킬은 `~/.agents/skills/`에 저장
- 심볼릭 링크는 자동으로 생성됨

## 🔄 동기화

이 저장소를 Git으로 관리하여 여러 장비에서 동기화:

```bash
cd ~/dotfiles/agent-skills
git init
git add .
git commit -m "Initial commit"
git remote add origin your-repo-url
git push -u origin main
```

새 장비:

```bash
git clone your-repo-url ~/dotfiles/agent-skills
cd ~/dotfiles/agent-skills
./install.sh
```
