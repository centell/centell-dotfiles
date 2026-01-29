# AI Agent Configuration

개인 AI 에이전트 설정, 스킬, 규칙 백업

## 구조

```
agents/
├── skills/        # ~/.agents/skills 백업
├── rules/         # ~/.agents/rules 백업
├── configs/       # 에이전트 설정 파일
├── backup.sh      # 백업 스크립트
└── install.sh     # 설치 스크립트
```

## 새 장비에 설치

```bash
cd ~/centell-dotfiles/agents
./install.sh
```

## 백업

```bash
cd ~/centell-dotfiles/agents
./backup.sh
```

## 포함 내용

### Skills
- **md-to-pdf**: 마크다운을 PDF로 변환

### Rules
- **commit-guide.md**: 커밋 메시지 작성 규칙
- **workflow-rules.md**: 워크플로우 규칙

## 지원 에이전트

- Claude Code
- Cursor
- Gemini CLI
- OpenCode

## 노트

- `~/.agents/skills/`: 글로벌 스킬
- `~/.agents/rules/`: 글로벌 규칙
- 프로젝트별 스킬은 각 프로젝트의 `.agents/skills/`에 저장
