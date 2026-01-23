# 사용 가이드

## 🚀 빠른 시작

### 1️⃣ 첫 번째 장비에서 (현재 Mac)

```bash
cd ~/dotfiles/agent-skills

# 백업 실행
./backup.sh

# Git 저장소 생성
git init
git add .
git commit -m "Initial: AI agent skills configuration"

# GitHub에 업로드
git remote add origin https://github.com/YOUR_USERNAME/agent-skills.git
git push -u origin main
```

### 2️⃣ 새 장비에서 (회사 Mac, Windows, Linux 등)

```bash
# 저장소 클론
git clone https://github.com/YOUR_USERNAME/agent-skills.git ~/dotfiles/agent-skills

# 설치 실행
cd ~/dotfiles/agent-skills
./install.sh
```

끝! 🎉

---

## 📋 상세 사용법

### 백업 업데이트

현재 장비의 최신 설정을 백업:

```bash
cd ~/dotfiles/agent-skills
./backup.sh

# Git에 커밋
git add .
git commit -m "Update skills: workflow-templates v1.1"
git push
```

### 다른 장비에서 최신 버전 받기

```bash
cd ~/dotfiles/agent-skills
git pull

# 재설치 (변경사항 반영)
./install.sh
```

---

## 🔧 수동 관리

### 새 글로벌 스킬 추가

```bash
# 1. 현재 장비에서 스킬 생성
mkdir -p ~/.agents/skills/my-new-skill
vim ~/.agents/skills/my-new-skill/SKILL.md

# 2. dotfiles에 백업
./backup.sh

# 3. Git 커밋
git add .
git commit -m "Add: my-new-skill"
git push
```

### 설정 파일 수정

```bash
# 1. 현재 설정 수정
vim ~/.claude/settings.local.json

# 2. 백업
./backup.sh

# 3. Git 커밋
git add .
git commit -m "Update: Claude settings - add new permissions"
git push
```

---

## 🌍 여러 장비 동기화 시나리오

### 시나리오 1: 집 Mac → 회사 Mac

**집 Mac:**
```bash
# 저녁에 새 스킬 추가
cd ~/dotfiles/agent-skills
./backup.sh
git add . && git commit -m "Add: security-checklist skill"
git push
```

**회사 Mac:**
```bash
# 다음날 아침
cd ~/dotfiles/agent-skills
git pull
./install.sh
# 즉시 같은 스킬 사용 가능!
```

### 시나리오 2: Mac → Windows

**Mac:**
```bash
cd ~/dotfiles/agent-skills
./backup.sh
git push
```

**Windows (PowerShell):**
```powershell
# Git Bash나 WSL에서:
cd ~/dotfiles/agent-skills
git pull
./install.sh
```

---

## 📊 프로젝트별 스킬 관리

### 글로벌 스킬 vs 프로젝트 스킬

**글로벌 스킬** (이 저장소에서 관리):
- `workflow-templates`: 모든 프로젝트 공통
- `security-checklist`: 모든 프로젝트 공통
- 위치: `~/.agents/skills/`

**프로젝트 스킬** (각 프로젝트 Git에서 관리):
- `weaver-coding-standards`: Weaver2 전용
- `weaver-ui-patterns`: Weaver2 전용
- 위치: `project/.agents/skills/`

### 새 프로젝트 시작

```bash
# 1. 글로벌 스킬은 이미 설치됨 ✅
ls ~/.agents/skills/
# workflow-templates

# 2. 프로젝트 클론
git clone project-repo
cd project-repo

# 3. 프로젝트 스킬 자동 사용 ✅
# .agents/skills/ 가 프로젝트에 포함되어 있음
```

---

## 🔍 트러블슈팅

### 심볼릭 링크가 깨졌을 때

```bash
cd ~/dotfiles/agent-skills
./install.sh
# 모든 링크 재생성됨
```

### 스킬이 인식 안 될 때

```bash
# 1. 디렉토리 확인
ls ~/.agents/skills/

# 2. 링크 확인
ls -la ~/.claude/skills/

# 3. 재설치
cd ~/dotfiles/agent-skills
./install.sh
```

---

## 💡 팁

### 빠른 백업 alias

`.bashrc` 또는 `.zshrc`에 추가:

```bash
alias backup-skills="cd ~/dotfiles/agent-skills && ./backup.sh && git add . && git commit -m 'Update skills' && git push"
```

사용:
```bash
backup-skills
# 한 명령어로 백업 + Git 업로드!
```

### 자동 동기화 (cron)

매일 밤 자동 백업:

```bash
# crontab -e
0 2 * * * cd ~/dotfiles/agent-skills && ./backup.sh && git add . && git commit -m "Auto backup" && git push
```

---

## 🎯 권장 워크플로우

### 일상적 사용

1. **스킬 수정 시:**
   - `vim ~/.agents/skills/workflow-templates/SKILL.md`
   - 수정 후: `backup-skills` (alias 사용)

2. **새 장비 추가 시:**
   - `git clone` → `./install.sh`

3. **정기 동기화:**
   - 일주일에 한 번: `git pull` → `./install.sh`

### 팀 공유

글로벌 스킬 중 일부만 팀과 공유하고 싶다면:

```bash
# 팀 공유용 저장소 별도 생성
mkdir -p ~/dotfiles/team-agent-skills
cp -r global-skills/workflow-templates ~/dotfiles/team-agent-skills/

# 팀 저장소로 푸시
cd ~/dotfiles/team-agent-skills
git init
git remote add origin team-repo-url
git push
```

---

## 📝 체크리스트

새 장비 설치 후 확인:

- [ ] `~/.agents/skills/` 존재
- [ ] `~/.claude/skills/` 링크 정상
- [ ] `~/.cursor/skills/` 링크 정상
- [ ] `~/.gemini/skills/` 링크 정상
- [ ] Claude Code에서 스킬 인식 확인
- [ ] Git pull 테스트

정기 백업 체크:

- [ ] 새 스킬 추가 시 백업
- [ ] 설정 변경 시 백업
- [ ] 월 1회 정기 백업 & 푸시
