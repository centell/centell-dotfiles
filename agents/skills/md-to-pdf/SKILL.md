---
name: md-to-pdf
description: Convert Markdown files to PDF using md-to-pdf package
license: MIT
metadata:
  author: devcjkim
  version: "1.0.0"
  scope: global
user-invocable: true
---

# Markdown to PDF Converter

마크다운 파일을 PDF로 변환합니다.

## Usage

```
/md-to-pdf <파일경로>
/md-to-pdf docs/report.md
/md-to-pdf README.md
```

## Requirements

- Node.js
- md-to-pdf 패키지 (npx로 자동 실행 가능)

## Instructions

사용자가 `/md-to-pdf` 명령을 실행하면:

1. 인자로 마크다운 파일 경로가 제공되었는지 확인
2. 파일이 존재하는지 확인
3. `npx md-to-pdf <파일경로>` 명령 실행
4. 생성된 PDF 파일 경로 안내

### 인자가 없는 경우

사용자에게 변환할 마크다운 파일 경로를 물어봅니다.

### 실행 예시

```bash
npx md-to-pdf docs/report.md
```

결과: `docs/report.pdf` 파일 생성

## Output

- PDF 파일은 원본 마크다운 파일과 같은 디렉토리에 생성됩니다
- 파일명은 `.md` → `.pdf`로 변경됩니다
