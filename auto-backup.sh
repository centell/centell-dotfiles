#!/bin/bash

# Centell Dotfiles - 자동 백업 스크립트
# Cron으로 실행됨: 매일 오후 5시

DOTFILES_DIR="$HOME/centell-dotfiles"
LOG_FILE="$DOTFILES_DIR/backup.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "======================================" >> "$LOG_FILE"
echo "[$DATE] 자동 백업 시작" >> "$LOG_FILE"

# 1. 백업 실행
cd "$DOTFILES_DIR"
./backup.sh >> "$LOG_FILE" 2>&1

if [ $? -ne 0 ]; then
    echo "[$DATE] 백업 실패" >> "$LOG_FILE"
    exit 1
fi

# 2. Git 변경사항 확인
if [[ -z $(git status -s) ]]; then
    echo "[$DATE] 변경사항 없음 - 종료" >> "$LOG_FILE"
    exit 0
fi

echo "[$DATE] 변경사항 감지" >> "$LOG_FILE"

# 3. Git add
git add . >> "$LOG_FILE" 2>&1

# 4. Git commit
COMMIT_MSG="chore(auto-backup): automated backup at $DATE"
git commit -m "$COMMIT_MSG" >> "$LOG_FILE" 2>&1

if [ $? -ne 0 ]; then
    echo "[$DATE] 커밋 실패" >> "$LOG_FILE"
    exit 1
fi

echo "[$DATE] 커밋 완료" >> "$LOG_FILE"

# 5. Git push
git push >> "$LOG_FILE" 2>&1

if [ $? -ne 0 ]; then
    echo "[$DATE] 푸시 실패" >> "$LOG_FILE"
    exit 1
fi

echo "[$DATE] 푸시 완료 - 자동 백업 성공" >> "$LOG_FILE"
exit 0
