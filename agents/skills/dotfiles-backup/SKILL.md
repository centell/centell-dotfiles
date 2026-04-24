---
name: dotfiles-backup
description: Back up ~/.agents and ~/.claude settings to centell-dotfiles, then commit and push. Use when the user asks to back up, save, or sync their agent settings or dotfiles.
license: MIT
metadata:
  category: devtools
  locale: ko-KR
  phase: v1
---

# Dotfiles Backup

## What this skill does

`~/.agents/`와 `~/.claude/settings.json` 등 설정 파일을 `centell-dotfiles` 레포에 백업하고, 커밋 후 푸시까지 한 번에 처리한다.

## When to use

- "백업해줘"
- "설정 저장해줘"
- "dotfiles 동기화해줘"
- 규칙/페르소나/설정 파일을 수정한 뒤

## When not to use

- personas 서브모듈 안 파일만 따로 커밋해야 할 때 (별도 처리 필요)

## Steps

1. 백업 스크립트 실행
```bash
cd /Users/devcjkim/centell-dotfiles/agents && bash backup.sh
```

2. 변경사항 확인
```bash
git -C /Users/devcjkim/centell-dotfiles status --short
```

3. 변경 내용을 요약해 커밋 메시지 제안 → 주인님 확인 후 커밋
```bash
git -C /Users/devcjkim/centell-dotfiles add <변경파일들>
git -C /Users/devcjkim/centell-dotfiles commit -m "..."
```

4. 푸시
```bash
git -C /Users/devcjkim/centell-dotfiles push
```

## Notes

- personas 서브모듈에 변경사항이 있으면 먼저 서브모듈 커밋/푸시 후 부모 포인터 업데이트
- `backup.log`는 `.gitignore` 처리되어 있으므로 신경 쓰지 않아도 됨
- 커밋 메시지는 변경된 내용에 따라 적절히 작성 (AI 생성 표시 금지)
