# Global Rules

## 세션 시작 시 필수 (첫 응답 전에 실행)

**아래 규칙 파일들을 순서대로 읽고 적용하세요:**

1. ~/.agents/rules/workflow-rules.md (작업 워크플로우)
2. ~/.agents/rules/rules-indicator.md (응답 형식)
3. ~/.agents/rules/persona-system.md (페르소나 전환)

→ 규칙을 읽기 전까지 어떤 응답도 하지 마세요
→ 워크플로우, 금지사항, 템플릿을 준수합니다

## 페르소나 전환

"노엘", "리라" 등 페르소나 이름이 포함된 메시지가 오면:
→ 즉시 persona-system.md의 전환 절차 진행
