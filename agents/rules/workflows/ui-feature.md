# UI Feature 워크플로우

## 적용 조건
- 백엔드 + 프론트엔드 변경을 모두 포함하는 기능 구현
- 키워드: "화면", "UI", "페이지", "컴포넌트", "프론트"
- 로드맵 노드 메타데이터: `{ workflowType: "ui-feature" }`

---

## Phase 1 — 준비

1. **로드맵 확인**: `search_memories(WORKING)` → `get_tree(projectId)`
2. **태스크 상태 변경**: `update_node_state(id, "IN_PROGRESS")`
3. **코드 파악**:
   - 관련 파일 5개 이하 → 직접 Read
   - 5개 초과 → **Explore 서브에이전트** 위임
     ```
     목표: [태스크명] 구현에 필요한 파일 파악
     컨텍스트: 기술 스택, 관련 모듈 경로
     기대 출력: 수정 대상 파일 목록 + 현재 구현 상태 200자 요약
     ```

---

## Phase 2 — 계획

4. **계획 보고** (세심 모드 필수):
   ```
   수정 파일 / 변경사항 / 의존성 / 주의사항
   백엔드·프론트 독립 여부 → 병렬 구현 가능한지 표시
   ```
5. **주인님 승인 대기**

---

## Phase 3 — 구현

6. **독립성 판단**:
   - 백엔드 DTO/서비스 변경이 프론트 타입에 영향 없으면 → **병렬 서브에이전트**
   - 의존성 있으면 → 순차 구현 (백엔드 먼저)
7. **타입 체크**: `tsc --noEmit` (백엔드/프론트 각각)

---

## Phase 4 — 검증

8. **검증 리스트 먼저 작성**:
   - 렌더링 확인 항목
   - 상호작용 (Happy path)
   - 엣지 케이스 (빈 상태, 취소, 토글)
9. **사전 조건 확인**:
   - DB/백엔드 서버 실행 여부
   - 필요한 시드 데이터 존재 여부 → 없으면 시드 추가
10. **agent-browser 검증** (메인 에이전트 직접):
    ```bash
    # 기본 패턴
    open → snapshot -i -c -s "main" → 상호작용 → 재스냅샷 → screenshot

    # 에러 발생 시
    eval "document.querySelector('.text-error')?.textContent"
    eval "(async () => { const r = await fetch('...'); return r.status; })()"
    ```
    - 이슈 발견 → 수정 → 재검증 반복
    - 완료 후 `agent-browser close`

---

## Phase 5 — 완료

11. **태스크 상태**: `update_node_state(id, "DONE")`
12. **완료 보고**: 수정 파일 목록 + 검증 결과 요약
13. **커밋 승인 후 커밋**: 영어 본문 + 한국어 번역 포함

---

## 배운 것 (경험 누적)

- **ValidationPipe whitelist**: `@Query()` DTO에 없는 파라미터는 422 반환
  → 쿼리 파라미터 추가 시 항상 DTO 확장 여부 확인
- **시드 데이터**: 기능 검증에 필요한 데이터는 시드에 포함시킬 것
- **CSRF**: Weaver2 토큰 엔드포인트는 `GET /v1/auth/csrf-token`
- **agent-browser ref 무효화**: 페이지 변경 후 반드시 재스냅샷
