# Commit Guide

Git 커밋 시 모든 AI 에이전트가 따라야 할 규칙

---

## 필수 사항

### 1. 커밋 전 반드시 사용자 확인

- 커밋 내용을 먼저 보여주고 승인받은 후 실행
- "이 내용으로 커밋하시겠습니까?" 확인 필수
- 승인 없이 커밋 실행 금지

### 2. AI 사용 표시 금지

다음 내용을 커밋 메시지에 절대 포함하지 말 것:

- `Co-Authored-By: Claude <noreply@anthropic.com>`
- `Co-Authored-By: Gemini`
- `Generated with Claude Code`
- `Generated with AI`
- 기타 AI가 작성했음을 나타내는 어떤 표시

### 3. 영어로 작성 + 한국어 번역 포함

- 제목(subject)과 본문(body)은 영어로 작성
- 본문 마지막에 `---` 구분선 후 한국어 번역 추가

---

## 커밋 메시지 형식

```
<type>(<scope>): <subject>

<body - 영어>

---
<body - 한국어 번역>
```

---

## Type

| Type | 설명 |
|------|------|
| `feat` | 새 기능 |
| `fix` | 버그 수정 |
| `refactor` | 리팩토링 |
| `docs` | 문서 수정 |
| `style` | 코드 포맷팅 |
| `test` | 테스트 추가/수정 |
| `chore` | 빌드/설정 변경 |

---

## Scope

scope는 **도메인/기능 영역**을 나타냅니다.

### 사용할 것

| 분류 | 예시 |
|------|------|
| 도메인 | `user`, `product`, `order`, `payment` |
| 기능 | `auth`, `search`, `notification`, `upload` |
| 공통 영역 | `common`, `config`, `db` |

### 피할 것

| 분류 | 예시 | 이유 |
|------|------|------|
| 레이어 | `controller`, `service`, `repository` | 무엇이 변경됐는지 알 수 없음 |
| 기술 스택 | `react`, `spring`, `postgres` | 도메인 맥락 부재 |
| 파일명 | `UserService`, `index` | 너무 구체적/모호함 |

### 규칙

- 소문자 사용
- 단일 단어 권장 (필요시 kebab-case: `user-profile`)
- 여러 영역 변경 시 핵심 영역 선택
- 전역/설정 변경은 scope 생략 가능

---

## 예시

```
feat(user): add profile image upload feature

- Add POST /api/user/profile/image endpoint
- Implement image validation (5MB limit)
- Store images in /uploads/profiles/

---
- POST /api/user/profile/image 엔드포인트 추가
- 이미지 검증 구현 (5MB 제한)
- /uploads/profiles/에 이미지 저장
```

```
fix(auth): resolve session expiration error

- Increase JWT expiration from 1h to 24h
- Add refresh token logic

---
- JWT 만료 시간 1시간에서 24시간으로 증가
- 리프레시 토큰 로직 추가
```

---

## Breaking Change

기존 동작을 깨뜨리는 변경 시 반드시 표기합니다.

### 표기 방법

**방법 1: 제목에 `!` 추가**

```
feat(api)!: change response format to JSON:API spec
```

**방법 2: 본문에 `BREAKING CHANGE:` 추가**

```
refactor(auth): migrate to JWT v2

BREAKING CHANGE: token format changed, all existing tokens invalidated

---
BREAKING CHANGE: 토큰 형식 변경, 기존 모든 토큰 무효화
```

### Breaking Change 해당 사례

- API 응답 구조 변경
- 필수 파라미터 추가/변경
- 함수/메서드 시그니처 변경
- 설정 파일 형식 변경
- 최소 지원 버전 상향

---

## 커밋 크기

### 원칙: 하나의 커밋 = 하나의 논리적 변경

### 권장 사항

| 항목 | 권장 | 피해야 할 것 |
|------|------|-------------|
| 파일 수 | 1-10개 | 20개 이상 |
| 변경 라인 | 50-200줄 | 500줄 이상 |
| 목적 | 단일 목적 | 여러 기능 혼합 |

### 분리해야 할 경우

- 기능 추가 + 버그 수정 → 별도 커밋
- 리팩토링 + 새 기능 → 별도 커밋
- 포맷팅 + 로직 변경 → 별도 커밋

### 합쳐도 되는 경우

- 기능과 해당 기능의 테스트
- 밀접하게 연관된 파일들의 변경

### 나쁜 예시 vs 좋은 예시

**나쁜 예시:**

```
feat: add login, fix header bug, update styles
```

**좋은 예시:**

```
feat(auth): add login feature
fix(header): resolve alignment bug
style(global): update button styles
```
