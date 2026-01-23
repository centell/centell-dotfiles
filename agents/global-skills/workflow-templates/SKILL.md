---
name: workflow-templates
description: Universal templates for planning reports, completion reports, and commit messages. Apply when preparing to start work, completing tasks, or creating commits in any project.
license: MIT
metadata:
  author: devcjkim
  version: "1.0.0"
  scope: global
user-invocable: true
---

# Workflow Templates (Universal)

작업 계획, 완료 보고, 커밋 메시지 템플릿 - 모든 프로젝트 공통

## When to Apply

이 템플릿은 다음 상황에서 사용:
- 새로운 작업 시작 전 계획 보고
- 작업 완료 후 결과 보고
- Git 커밋 메시지 작성

---

## ⚡ 필수 워크플로우 (3단계)

**모든 작업은 반드시 이 순서를 따라야 합니다:**

```
1️⃣ 계획 보고 → 사용자 승인 대기
2️⃣ 작업 수행 (승인된 내용만)
3️⃣ 완료 보고 → 사용자 승인 대기
```

### 🚫 절대 금지

- ❌ 승인 없이 작업 진행
- ❌ 요청받지 않은 추가 작업 수행
  - 예: "커밋해줘" → 커밋만 / 브랜치 변경, 푸시는 하지 말 것
- ❌ 질문 없이 임의 판단하여 진행
- ❌ "아마도 이것도 원하실 것 같아서..." 식의 추측 작업

### ✅ 올바른 예시

```
사용자: "데이터베이스 마이그레이션 만들어줘"

AI: [계획 보고]
    "마이그레이션 파일 생성 계획입니다.
     생성 후 실행하시겠습니까?
     승인해주시면 작업 시작하겠습니다."

사용자: "생성만 해"

AI: [작업 수행 - 생성만]
    [완료 보고]
    "마이그레이션 파일 생성 완료했습니다.
     실행하시겠습니까?"
```

### ❌ 잘못된 예시

```
사용자: "커밋해줘"

AI: [승인 없이 진행]
    - git commit ❌ (요청함)
    - git branch -M main ❌ (요청 안 함!)
    - git push ❌ (요청 안 함!)
```

---

## 📋 계획 보고 템플릿

### 기본 형식

```markdown
## 작업 계획: [기능명]

**수정 파일**:
- `path/to/file1.ts` - 변경 내용 요약
- `path/to/file2.tsx` - 변경 내용 요약

**변경사항**:
1. 주요 변경 내용 1
2. 주요 변경 내용 2
3. 주요 변경 내용 3

**주의사항**:
- 호환성 이슈 (있다면)
- 기존 기능에 미치는 영향
- 테스트 필요 사항

**승인해주시면 작업 시작하겠습니다.**
```

### 예시 1: 새 기능 추가

```markdown
## 작업 계획: 사용자 프로필 이미지 업로드 기능

**수정 파일**:
- `apps/core/src/features/user/controllers/user-profile.controller.ts` - 업로드 엔드포인트 추가
- `apps/core/src/features/user/services/update-profile.service.ts` - 이미지 처리 로직
- `apps/core/prisma/schema.prisma` - User 모델에 profileImage 필드 추가

**변경사항**:
1. POST /api/user/profile/image 엔드포인트 생성
2. Multer를 사용한 파일 업로드 처리
3. 이미지 검증 (크기, 타입)
4. Prisma 마이그레이션 생성

**주의사항**:
- 기존 프로필 데이터와 호환성 유지
- 파일 크기 제한: 5MB
- Migration 실행은 사용자가 직접 수행

**승인해주시면 작업 시작하겠습니다.**
```

### 예시 2: 버그 수정

```markdown
## 작업 계획: 로그인 시 세션 만료 오류 수정

**수정 파일**:
- `apps/core/src/features/auth/services/sign-in.service.ts` - 토큰 만료 시간 수정

**변경사항**:
1. JWT 만료 시간 1시간 → 24시간으로 변경
2. RefreshToken 로직 추가

**주의사항**:
- 기존 로그인된 사용자는 재로그인 필요

**승인해주시면 작업 시작하겠습니다.**
```

---

## ✅ 완료 보고 템플릿

### 기본 형식

```markdown
## 작업 완료: [기능명]

**수정된 파일**:
- `path/to/file1.ts`
  - 변경 내용 상세 1
  - 변경 내용 상세 2
- `path/to/file2.tsx`
  - 변경 내용 상세

**새 기능**:
- 추가된 기능 1
- 추가된 기능 2

**테스트 방법**:
1. 테스트 단계 1
2. 테스트 단계 2

**제한사항** (있다면):
- 알려진 제약사항
- 향후 개선 필요 사항

**커밋하시겠습니까?**
```

### 예시

```markdown
## 작업 완료: 사용자 프로필 이미지 업로드 기능

**수정된 파일**:
- `apps/core/src/features/user/controllers/user-profile.controller.ts`
  - POST /api/user/profile/image 엔드포인트 추가
  - Multer 설정으로 파일 업로드 처리
- `apps/core/src/features/user/services/update-profile.service.ts`
  - updateProfileImage() 메서드 구현
  - 이미지 검증 로직 (5MB 제한, jpg/png만 허용)
- `apps/core/prisma/schema.prisma`
  - User 모델에 profileImage String? 필드 추가
- `apps/core/prisma/migrations/20260122_add_profile_image.sql`
  - Migration 파일 생성 (실행은 미완료)

**새 기능**:
- 사용자가 프로필 이미지를 업로드할 수 있음
- 업로드된 이미지는 /uploads/profiles/ 에 저장
- 기존 이미지는 자동으로 삭제됨

**테스트 방법**:
1. 먼저 Migration 실행: `npm run db:migrate`
2. POST /api/user/profile/image 로 이미지 파일 전송
3. 프로필 페이지에서 이미지 확인

**제한사항**:
- 현재는 로컬 파일 시스템에 저장 (추후 S3 연동 권장)
- 이미지 리사이징 미구현

**커밋하시겠습니까?**
```

---

## 📝 커밋 메시지 템플릿

### 기본 형식

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type 종류

- `feat`: 새 기능
- `fix`: 버그 수정
- `refactor`: 리팩토링
- `docs`: 문서 수정
- `style`: 코드 포맷팅
- `test`: 테스트 추가/수정
- `chore`: 빌드/설정 변경

### Scope 예시

- `auth`: 인증 관련
- `user`: 사용자 관련
- `admin`: 관리자 관련
- `ui`: UI 컴포넌트
- `db`: 데이터베이스

### 예시 1: 기능 추가

```
feat(user): add profile image upload feature

- Add POST /api/user/profile/image endpoint
- Implement image validation (5MB limit, jpg/png only)
- Add profileImage field to User model
- Create migration for profile image support
```

### 예시 2: 버그 수정

```
fix(auth): resolve session expiration error

- Increase JWT expiration from 1h to 24h
- Add refresh token logic
```

### 예시 3: 리팩토링

```
refactor(user): extract common user query logic

- Create reusable findUserQuery repository
- Update controllers to use shared query
- Remove duplicate code
```

---

## 🚫 금지 사항

### 커밋 메시지에 절대 포함 금지

```
❌ 🤖 Generated with Claude Code
❌ Co-Authored-By: Claude <noreply@anthropic.com>
❌ AI 생성 표시
```

**올바른 예시:**
```
✅ feat(user): add profile image upload feature
```

---

## 긴급 상황 (간소화 버전)

버그 수정 등 긴급 상황에서는 계획 보고 간소화 가능:

```markdown
## 긴급 수정: [문제 설명]

**파일**: `path/to/file.ts`
**변경**: 변경 내용 1줄 요약
**즉시 작업 시작합니다.**
```

완료 보고 및 커밋은 여전히 필수!

---

## 📌 프로젝트별 커스터마이징

이 템플릿은 범용적이며, 프로젝트별 규칙은 해당 프로젝트의 CLAUDE.md나 프로젝트 스킬에서 추가 정의하세요.

**예시:**
- 승인 프로세스 필요 여부
- 특정 커밋 메시지 형식
- 프로젝트 특화 체크리스트

---

## 참고

- 모든 작업은 사용자 승인 후 시작 **(필수)**
- 모든 커밋은 사용자 확인 후 실행 **(필수)**
- 승인되지 않은 추가 작업 금지 **(필수)**
- AI 생성 표시 절대 금지 **(필수)**
